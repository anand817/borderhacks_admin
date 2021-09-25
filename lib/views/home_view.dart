import 'package:borderhacks/viewmodels/home_viewmodel.dart';
import 'package:borderhacks/views/base_view.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) => Container(),
    );
  }
}
