import 'package:corona_karma/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  User user;
  final positionsCollection = Firestore.instance.collection('positions');
  final requestsCollection = Firestore.instance.collection('requests');
  DateTime lastCall = DateTime.now();

  Future createPositionRecord(double long, double lat) async {
    DateTime now = DateTime.now();
    if (now.difference(lastCall).inSeconds > 30 || user == null) {
      lastCall = now;
      print("===> Save:");
      print({'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat});
      print("to document with id" + user.uid);
      return await positionsCollection.document(user.uid).setData(
          {'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat});
    }
    return;
  }

  Stream<List<PositionData>> get positions {
    return positionsCollection.snapshots().map(_positionListFromSnapshot);
  }

  List<PositionData> _positionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return PositionData(
        username: doc.data['username'] ?? '',
        long: doc.data['long'] ?? 0,
        lat: doc.data['lat'] ?? 0,
      );
    }).toList();
  }

  Future createHelpRequest(List<String> requests, String note) async {
    return await requestsCollection.document(user.uid).setData(
        {'requests': requests, 'requestUser': user.name, 'note': note});
  }

  Future<HelpRequest> getOwnRequest() async {
    DocumentSnapshot snapshot = await requestsCollection.document(user.uid).get();
    return HelpRequest(
        requestUser: snapshot.data['requestUser'],
        requests: List<String>.from(snapshot.data['requests']),
        note: snapshot.data['note']
      );
  }
}

class PositionData {
  String username;
  double long;
  double lat;

  PositionData({this.username, this.long, this.lat});
}

class HelpRequest {
  String requestUser;
  List<String> requests;
  String note;

  HelpRequest({this.requestUser, this.requests, this.note});
}
