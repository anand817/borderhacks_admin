import 'package:borderhacks/locator.dart';
import 'package:borderhacks/services/auth_service.dart';
import 'package:borderhacks/services/localstorage_service.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late String _path;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get path => _path;

  Future<void> authenticate(String title) async {
    if (_formKey.currentState!.validate()) {
      if (title == 'Log in') {
        _authService
            .signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        )
            .then(
          (value) {
            _localStorageService.isLoggedIn = true;
            Get.offAndToNamed('/landing');
          },
        );
      } else {
        _authService
            .signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        )
            .then(
          (value) {
            _localStorageService.isLoggedIn = true;
            Get.offAndToNamed('/landing');
          },
        );
      }
    }
  }

  void onModelReady(String title) {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    if (title == 'Log in') {
      _path = 'signup';
    } else {
      _path = 'login';
    }
  }

  void onModelDestroy() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
