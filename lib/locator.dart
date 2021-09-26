import 'package:borderhacks/services/auth_service.dart';
import 'package:borderhacks/services/localstorage_service.dart';
import 'package:borderhacks/services/profile_database_service.dart';
import 'package:borderhacks/viewmodels/auth_viewmodel.dart';
import 'package:borderhacks/viewmodels/home_viewmodel.dart';
import 'package:borderhacks/viewmodels/landing_viewmodel.dart';
import 'package:borderhacks/viewmodels/profile_viewmodel.dart';
import 'package:borderhacks/viewmodels/startup_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //services
  var localStorage = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorage);

  var _firebaseAuth = FirebaseAuth.instance;
  locator.registerSingleton<FirebaseAuth>(_firebaseAuth);

  var _firebaseFirestore = FirebaseFirestore.instance;
  locator.registerSingleton<FirebaseFirestore>(_firebaseFirestore);

  locator.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());

  var _profileDatabaseService = ProfileDatabaseService();
  locator.registerSingleton<ProfileDatabaseService>(_profileDatabaseService);

  //viewmodels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<LandingViewModel>(() => LandingViewModel());
  locator.registerFactory<ProfileViewmodel>(() => ProfileViewmodel());
}
