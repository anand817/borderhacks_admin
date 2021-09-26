import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:borderhacks/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingViewModel extends BaseViewModel {
  final List<Widget> _views = [
    Home(),
    Home(),
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
  ];

  int _activeTab = 0;

  int get activeTab => _activeTab;

  Widget get activeBody => _views[activeTab];

  Color get activeColor => _colors[activeTab];

  set activeTab(int activeTab) {
    _activeTab = activeTab;
    notifyListeners();
  }
}
