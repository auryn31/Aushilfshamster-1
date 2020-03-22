import 'package:corona_karma/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class DatabaseService {
  final User user;
  final dataReference = Firestore.instance.collection('positions');

  DatabaseService({this.user});

  Future createPositionRecord(double long, double lat) async {
    sleep(const Duration(seconds: 10));
    print("\n\n===> Save:");
    print("     " + {'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat}.toString());
    print("     to document with id" + user.uid);
    return await dataReference.document(user.uid).setData(
        {'uid': user.uid, 'username': user.name, 'long': long, 'lat': lat});
  }
}
