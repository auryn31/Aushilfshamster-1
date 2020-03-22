import 'package:corona_karma/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  ChatService(this._uid);
  final String _uid;

  final chatsCollections = Firestore.instance.collection('chats');

  Stream<Iterable<Chat>> get chats {
    return chatsCollections
        .where("owners", arrayContains: _uid)
        .where("done", isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.documents.map((doc) => Chat(
            owners: List<String>.from(doc.data["owners"]),
            ownerNames: List<String>.from(doc.data["ownerNames"]),
            requester: doc.data["requester"],
            chatID: doc.documentID,
            chatIcon: doc.data["chatIcon"],
            accepted: doc.data["accepted"],
            done: doc.data["done"],
            timestamp:
                DateTime.fromMicrosecondsSinceEpoch(doc.data["timestamp"]))));
  }
}
