import 'package:borderhacks/services/appointment_service.dart';
import 'package:borderhacks/services/auth_service.dart';
import 'package:borderhacks/services/localstorage_service.dart';
import 'package:borderhacks/services/profile_database_service.dart';
import 'package:borderhacks/services/doctor_info_service.dart';
import 'package:borderhacks/viewmodels/auth_viewmodel.dart';
import 'package:borderhacks/viewmodels/input_form_viewmodel.dart';
import 'package:borderhacks/viewmodels/appointments_viewmodel.dart';
import 'package:borderhacks/viewmodels/date_appointment_viewmodel.dart';
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
  locator.registerSingleton<DoctorInfoService>(DoctorInfoService());

  var _profileDatabaseService = ProfileDatabaseService();
  locator.registerSingleton<ProfileDatabaseService>(_profileDatabaseService);

  var _appointmentService = AppointmentService();
  locator.registerSingleton<AppointmentService>(_appointmentService);

  //viewmodels
  locator.registerFactory<InputFormViewModel>(() => InputFormViewModel());
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  locator.registerFactory<LandingViewModel>(() => LandingViewModel());
  locator.registerFactory<ProfileViewmodel>(() => ProfileViewmodel());
  locator.registerFactory<AppointmentViewmodel>(() => AppointmentViewmodel());
  locator.registerFactory<DateAppointmentViewModel>(
      () => DateAppointmentViewModel());
}
