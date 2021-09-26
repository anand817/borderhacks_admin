import 'package:borderhacks/constants/constants.dart';
import 'package:borderhacks/locator.dart';
import 'package:borderhacks/models/docter_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileDatabaseService {
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();
  final FirebaseAuth _auth = locator<FirebaseAuth>();

  Future<Doctor> get profile async => await _getProfile();

  Future<Doctor> _getProfile() async {
    var doctor = await _firestore
        .collection(doctors_key)
        .doc(_auth.currentUser!.uid)
        .get();
    return Doctor(
      name: doctor.data()![name_key],
      specialization: doctor.data()![specialization_key],
      timing: doctor.data()![timing_key],
      address: doctor.data()![address_key],
      qualification: doctor.data()![qualification_key],
      fees: doctor.data()![fees_key],
    );
  }
}
