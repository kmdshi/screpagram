// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

class FeedFbRepo {
  final FirebaseFirestore firebaseFirestore;
  FeedFbRepo({
    required this.firebaseFirestore,
  });

  Future<void> addPost(PostModel post) async {
    final docRef = firebaseFirestore.collection('posts').doc();
    final postWithId = post.copyWith(id: docRef.id);
    await docRef.set(postWithId.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
    return firebaseFirestore.collection('posts').snapshots();
  }
}
