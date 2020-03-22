import 'package:cloud_firestore/cloud_firestore.dart';

class AwardService {
  AwardService(this._uid);
  final String _uid;

  final chatsCollections = Firestore.instance.collection('chats');

  Stream<int> get awards => chatsCollections
      .where("owners", arrayContains: _uid)
      .where("done", isEqualTo: true)
      .snapshots()
      .map((QuerySnapshot snapshot) => snapshot.documents
          .where((doc) => doc.data["requester"] != _uid)
          .length);
}
