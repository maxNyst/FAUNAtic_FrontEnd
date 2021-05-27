import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore firestore;
  User firebaseUser;
  String userId;
  DocumentReference userRef;

  FirestoreService(this.firestore);

  void setUser(User user) {
    firebaseUser = user;
    userId = user.uid;
    userRef = firestore.collection('users').doc(userId);
    userRef.set({'Place': '', 'Address': '', 'Lat': '', 'Lng': ''});
  }

  void addNewUser() async {
    await firestore.collection('users').doc(userId).collection('excursions').doc('hellas').set(
        {'title': 'Hellas'});
  }

  void addPlaceToExcursion(String excursion, String place, String lat, String lng) async {
    await userRef.collection('excursions').doc('$excursion').set({
      'Title': '$excursion',
      'Place': '$place',
      'Lat': '$lat',
      'Lng': '$lng',
    });
  }

}