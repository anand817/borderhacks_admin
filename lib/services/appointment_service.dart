import '../../constants/constants.dart';
import 'package:borderhacks/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();
  final String currentUserId = '6ZL35l89WaNXYUu0Y3CHXhd9lf62';
  DateTime currentDate = DateTime.now();
  DateTime get date =>
      DateTime(currentDate.year, currentDate.month, currentDate.day);

  Stream<QuerySnapshot<Map<String, dynamic>>> getAppointments() {
    return _firestore
        .collection(doctors_key)
        .doc(currentUserId)
        .collection(appointments_key)
        .where(date_key, isGreaterThanOrEqualTo: date)
        .orderBy(date_key)
        .limit(10)
        .snapshots();
  }
}
