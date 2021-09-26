import 'package:borderhacks/ui/views/base_view.dart';
import 'package:borderhacks/ui/views/date_appointment_view.dart';
import 'package:borderhacks/viewmodels/appointments_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  Widget _buildDateTile(String date, Map<String, dynamic> pateints) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(date),
      ),
      onTap: () => Get.to(DateAppointmentView(date: date, document: pateints)),
    );
  }

  Widget _buildList(QuerySnapshot<Map<String, dynamic>> data) {
    return ListView.builder(
      itemCount: data.size,
      itemBuilder: (BuildContext context, int index) =>
          _buildDateTile(data.docs[index].id, data.docs[index].data()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppointmentViewmodel>(
      builder: (context, model, child) => StreamBuilder(
        stream: model.appointments,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            var data = snapshot.data!;
            return _buildList(data);
          }
          return Center(
            child: Text('You have no appointments'),
          );
        },
      ),
    );
  }
}
