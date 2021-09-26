import 'package:borderhacks/locator.dart';
import 'package:borderhacks/services/appointment_service.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentViewmodel extends BaseViewModel {
  final _appointmentService = locator<AppointmentService>();

  Stream<QuerySnapshot<Map<String, dynamic>>> get appointments =>
      _appointmentService.getAppointments();
}
