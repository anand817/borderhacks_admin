import 'package:borderhacks/ui/views/appointment_view.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:borderhacks/ui/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingViewModel extends BaseViewModel {
  final List<Widget> _views = [
    AppointmentView(),
    ProfileView(),
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
  ];

  final List<String> _headings = [
    'My Appointments',
    'Profile',
  ];

  int _activeTab = 0;

  int get activeTab => _activeTab;

  Widget get activeBody => _views[activeTab];

  Color get activeColor => _colors[activeTab];

  String get activeHeading => _headings[activeTab];

  set activeTab(int activeTab) {
    _activeTab = activeTab;
    notifyListeners();
  }
}
