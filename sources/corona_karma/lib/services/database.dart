import 'package:corona_karma/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  User user;
  final positionsCollection = Firestore.instance.collection('positions');
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
}

class PositionData {
  String username;
  double long;
  double lat;

  PositionData({this.username, this.long, this.lat});
}
