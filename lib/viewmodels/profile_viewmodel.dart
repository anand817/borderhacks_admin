import 'package:borderhacks/enums/view_state.dart';
import 'package:borderhacks/locator.dart';
import 'package:borderhacks/models/docter_model.dart';
import 'package:borderhacks/services/profile_database_service.dart';
import 'package:borderhacks/viewmodels/base_viewmodel.dart';

class ProfileViewmodel extends BaseViewModel {
  final ProfileDatabaseService _profileService =
      locator<ProfileDatabaseService>();

  late final Doctor _profile;

  Doctor get profile => _profile;

  set profile(Doctor profile) {
    _profile = profile;
    notifyListeners();
  }

  String get name => profile.name;
  String get qualification => profile.qualification;
  String get specialisation => profile.specialisation;
  String get address => profile.address;
  int get fees => profile.fees;
  String get timing => profile.timing;

  void fetchProfile() async {
    setState(ViewState.Busy);
    profile = await _profileService.profile;
    setState(ViewState.Idle);
  }
}
