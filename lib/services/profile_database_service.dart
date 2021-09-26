import 'package:borderhacks/constants.dart';
import 'package:borderhacks/locator.dart';
import 'package:borderhacks/models/docter_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDatabaseService {
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();

  // for temporary testing
  final String currentUserId = '6ZL35l89WaNXYUu0Y3CHXhd9lf62';

  Future<Doctor> get profile async => await _getProfile();

  Future<Doctor> _getProfile() async {
    var doctor =
        await _firestore.collection(doctors_key).doc(currentUserId).get();
    return Doctor(
      name: doctor.data()![name_key],
      specialisation: doctor.data()![specialisation_key],
      timing: doctor.data()![timing_key],
      address: doctor.data()![address_key],
      qualification: doctor.data()![qualification_key],
      fees: doctor.data()![fees_key],
    );
  }
}
