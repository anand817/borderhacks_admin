import 'package:borderhacks/locator.dart';
import 'package:borderhacks/services/localstorage_service.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';
import 'package:get/get.dart';

class StartUpViewModel extends BaseViewModel {
  final LocalStorageService localStorageService =
      locator<LocalStorageService>();

  void onModelReady() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.offAllNamed(
      localStorageService.isLoggedIn ? '/landing' : '/login',
    );
  }
}
