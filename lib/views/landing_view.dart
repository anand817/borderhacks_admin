import 'package:borderhacks/viewmodels/landing_viewmodel.dart';
import 'package:borderhacks/views/base_view.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('App'),
          backgroundColor: model.activeColor,
        ),
        body: model.activeBody,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.activeTab,
          onTap: (index) => model.activeTab = index,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Appointments',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
