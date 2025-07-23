// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

class FeedFbRepo {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  FeedFbRepo({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Future<void> addPost(PostModel post) async {
    final docRef = firebaseFirestore.collection('posts').doc();
    final postWithId = post.copyWith(id: docRef.id);
    await docRef.set(postWithId.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
    return firebaseFirestore.collection('posts').snapshots();
  }

  Future<List<ActionModel>> getUserActions() async {
    final cur = firebaseAuth.currentUser?.uid ?? '';
    final snapshot = await firebaseFirestore
        .collection('actions')
        .where('targetId', isEqualTo: cur)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ActionModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> acceptFriendRequest(String actorId, String actionId) async {
    final cur = firebaseAuth.currentUser?.uid;
    if (cur == null) throw Exception('Неавторизован');

    final firestore = firebaseFirestore;
    final profiles = firestore.collection('profiles');
    final actions = firestore.collection('actions');

    final myDoc = await profiles.doc(cur).get();
    final otherDoc = await profiles.doc(actorId).get();

    final myData = myDoc.data()!;
    final otherData = otherDoc.data()!;

    final myFriends = List<String>.from(myData['friends'] ?? []);
    final myRequests = List<String>.from(myData['friendRequests'] ?? []);
    final hisFriends = List<String>.from(otherData['friends'] ?? []);

    myRequests.remove(actorId);

    if (!myFriends.contains(actorId)) myFriends.add(actorId);
    if (!hisFriends.contains(cur)) hisFriends.add(cur);

    await Future.wait([
      profiles.doc(cur).update({
        'friendRequests': myRequests,
        'friends': myFriends,
      }),
      profiles.doc(actorId).update({
        'friends': hisFriends,
      }),
      actions.doc(actionId).delete(),
    ]);
  }

  Future<void> rejectFriendRequest(String actorId, String actionId) async {
    final cur = firebaseAuth.currentUser?.uid;
    if (cur == null) throw Exception('Неавторизован');

    final profiles = firebaseFirestore.collection('profiles');
    final actions = firebaseFirestore.collection('actions');

    final myDoc = await profiles.doc(cur).get();
    final myData = myDoc.data()!;

    final myRequests = List<String>.from(myData['friendRequests'] ?? []);
    myRequests.remove(actorId);

    await Future.wait([
      profiles.doc(cur).update({
        'friendRequests': myRequests,
      }),
      actions.doc(actionId).delete(),
    ]);
  }
}
