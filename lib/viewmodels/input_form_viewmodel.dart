import 'package:borderhacks/enums/view_state.dart';
import 'package:borderhacks/locator.dart';
import 'package:borderhacks/model/doctor_model.dart';
import 'package:borderhacks/services/doctor_info_service.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputFormViewModel extends BaseViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DoctorInfoService _infoService = locator<DoctorInfoService>();
  late DateTime _from, _to;
  late TextEditingController _nameController,
      _addressController,
      _appointmentfeeController,
      _qualificationController,
      _specializationController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get appointmentfeeController =>
      _appointmentfeeController;
  TextEditingController get qualificationController => _qualificationController;
  TextEditingController get specializationController =>
      _specializationController;
  DateTime get from => _from;
  DateTime get to => _to;

  String? validateTextField(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  void setTime(TimeOfDay time, String command) {
    switch (command) {
      case 'from':
        _from = DateTime(
          _from.year,
          _from.month,
          _from.day,
          time.hour,
          time.minute,
        );
        break;
      case 'to':
        _to = DateTime(
          _to.year,
          _to.month,
          _to.day,
          time.hour,
          time.minute,
        );
        break;
    }
    notifyListeners();
  }

  Future<void> setInfo() async {
    var info = Doctor(
      name: _nameController.text.trim(),
      address: _addressController.text.trim(),
      fee: _appointmentfeeController.text.trim(),
      qualification: _qualificationController.text.trim(),
      specialization: _specializationController.text.trim(),
      timing: '${DateFormat.jm().format(_from)}-${DateFormat.jm().format(_to)}',
    );
    await _infoService.setDoctorInfo(info).then(
          (value) => Get.offAndToNamed('/landing'),
        );
  }

  void onModelReady() async {
    setState(ViewState.Busy);
    var isExist = await _infoService.doesExist();
    if (isExist) Get.offAndToNamed('/landing');
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _appointmentfeeController = TextEditingController();
    _qualificationController = TextEditingController();
    _specializationController = TextEditingController();
    _from = _to = DateTime.now();
    setState(ViewState.Idle);
  }

  void onModelDestroy() {
    _nameController.dispose();
    _addressController.dispose();
    _qualificationController.dispose();
    _specializationController.dispose();
    _appointmentfeeController.dispose();
  }
}
