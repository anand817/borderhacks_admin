import 'package:borderhacks/constants/constants.dart';
import 'package:borderhacks/ui/views/base_view.dart';
import 'package:borderhacks/viewmodels/date_appointment_viewmodel.dart';
import 'package:flutter/material.dart';

class DateAppointmentView extends StatelessWidget {
  final String date;
  final Map<String, dynamic> document;
  const DateAppointmentView({
    required this.date,
    required this.document,
    Key? key,
  }) : super(key: key);

  Widget _buildPatientTile(String name, int age, String address) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        child: Text('$name : $age'),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        child: Text(address),
      ),
    );
  }

  Widget _buildAppointmentList() {
    Map<String, dynamic> patients = document[patients_key];
    List<String> keys = patients.keys.toList();
    return ListView.builder(
        itemCount: patients.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> patient = patients[keys[index]]!;
          return _buildPatientTile(
            keys[index],
            patient.values.toList()[0],
            patient.keys.toList()[0],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DateAppointmentViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(date),
          centerTitle: true,
        ),
        body: _buildAppointmentList(),
      ),
    );
  }
}
