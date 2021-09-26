import 'package:borderhacks/locator.dart';
import 'package:borderhacks/ui/views/auth_view.dart';
import 'package:borderhacks/ui/views/landing_view.dart';
import 'package:borderhacks/ui/views/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => StartUpView()),
        GetPage(
          name: '/login',
          page: () => const AuthView('Log in', 'Sign Up'),
        ),
        GetPage(
          name: '/signup',
          page: () => const AuthView('Sign Up', 'Log In'),
        ),
        GetPage(name: '/landing', page: () => LandingView()),
      ],
      home: StartUpView(),
    );
  }
}
