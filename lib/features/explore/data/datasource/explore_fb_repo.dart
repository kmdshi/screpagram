import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/core/domain/models/person_entity.dart';

class ExploreFbRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  ExploreFbRepo(this.firestore, this.firebaseAuth);

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
    return firestore.collection('posts').snapshots();
  }

  Future<List<PersonEntity>> getAllUsers() async {
    final cur = firebaseAuth.currentUser!.uid;
    final snapshot = await firestore.collection('profiles').get();
    return snapshot.docs
        .where((doc) => doc.id != cur)
        .map((doc) => PersonEntity.fromMap(doc.data()))
        .toList();
  }

  Future<PersonEntity> getUserById(String userId) async {
    final doc = await firestore.collection('profiles').doc(userId).get();

    return PersonEntity.fromMap(doc.data()!);
  }

  Future<void> addUserToFriends(String uid) async {
    final currentUid = firebaseAuth.currentUser!.uid;
    final profileRef = firestore.collection('profiles').doc(uid);
    final doc = await profileRef.get();

    final friendRequests =
        List<String>.from(doc.data()?['friendRequests'] ?? []);

    if (!friendRequests.contains(currentUid)) {
      friendRequests.add(currentUid);

      await profileRef.update({'friendRequests': friendRequests});

      await firestore.collection('actions').add({
        'title': 'Запрос в друзья',
        'description':
            'Гражданин №${currentUid.substring(0, 6)} хочет добавить вас',
        'timestamp': DateTime.now(),
        'type': 'friendRequest',
        'actorId': currentUid,
        'targetId': uid,
      });
    } else {
      throw Exception('Вы уже отправили заявку!');
    }
  }
}
