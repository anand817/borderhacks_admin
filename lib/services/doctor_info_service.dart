import 'package:borderhacks/locator.dart';
import 'package:borderhacks/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorInfoService {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  Future setDoctorInfo(Doctor info) async {
    try {
      await _firebaseFirestore
          .collection('Doctors')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(
        {
          'name': info.name,
          'address': info.address,
          'fee': info.fee,
          'qualification': info.qualification,
          'specialization': info.specialization,
          'timing': info.timing,
        },
      );
      print('added succesfully');
    } catch (e) {
      print('${e.toString()}');
    }
  }

  Future<bool> doesExist() async {
    try {
      var res = await _firebaseFirestore
          .collection('Doctors')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return res.exists;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
