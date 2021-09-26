import 'package:borderhacks/viewmodels/home_viewmodel.dart';
import 'package:borderhacks/viewmodels/landing_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<LandingViewModel>(() => LandingViewModel());
}
