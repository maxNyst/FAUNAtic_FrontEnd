import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faunatic_front_end/excursion_model.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore firestore;
  String email;
  User firebaseUser;
  String userId;
  DocumentReference userRef;
  CollectionReference excursionsRef;
  CollectionReference favoritesRef;

  FirestoreService(this.firestore);

  void setUser(User user) {
    firebaseUser = user;
    userId = user.uid;
    email = user.email;
    userRef = firestore.collection('users').doc(email);
    favoritesRef = userRef.collection('favorites').withConverter<SpeciesDetail>(
          fromFirestore: (snapshot, _) =>
              SpeciesDetail.fromJson(snapshot.data()),
          toFirestore: (speciesDetail, _) => speciesDetail.toJson(),
        );
    excursionsRef = userRef.collection('excursions').withConverter<Excursion>(
          fromFirestore: (snapshot, _) => Excursion.fromJson(snapshot.data()),
          toFirestore: (excursion, _) => excursion.toJson(),
        );
    //userRef.set({'place': '', 'address': '', 'lat': '', 'lng': ''});
  }

  void addNewUser() async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('excursions')
        .doc('hellas')
        .set({'title': 'Hellas'});
  }

  void addPlaceToExcursion(
      String excursion, String place, String lat, String lng) async {
    await userRef.collection('excursions').doc('$excursion').set({
      'title': '$excursion',
      'place': '$place',
      'lat': '$lat',
      'lng': '$lng',
    });
  }

  Future<void> addExcursion(
      String name, GoogleMaps location, List momentsList) {
    final excursion = Excursion(
        userId: userId,
        name: name,
        location: location,
        momentsList: momentsList);
    return excursionsRef.doc(name).set(excursion);
  }

   Future<void> addFavorite(SpeciesDetail speciesDetail) {
    return favoritesRef.doc(speciesDetail.swedishName).set(speciesDetail);
  }

  Stream<List<SpeciesDetail>> getFavorites() {
    final stream = favoritesRef.snapshots().map(
        (list) => list.docs.map((e) => e.data() as SpeciesDetail).toList());
    return stream;
  }

  Stream<List<Excursion>> getExcursions() {
    final stream = excursionsRef
        .snapshots()
        .map((list) => list.docs.map((e) => e.data() as Excursion).toList());
    print(stream);
    stream.forEach((element) {
      print(element);
    });

    return stream;
  }
}
