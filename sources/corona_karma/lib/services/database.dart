import 'package:corona_karma/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  User user;
  final dataReference = Firestore.instance.collection('positions');
  DateTime lastCall = DateTime.now();

  Future createPositionRecord(double long, double lat) async {
    DateTime now = DateTime.now();
    if (now.difference(lastCall).inSeconds > 30 || user == null) {
      lastCall = now;
      print("===> Save:");
      print({'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat});
      print("to document with id" + user.uid);
      return await dataReference.document(user.uid).setData(
          {'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat});
    }
    return;
  }
}
