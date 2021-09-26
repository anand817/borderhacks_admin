import 'package:borderhacks/enums/view_state.dart';
import 'package:borderhacks/viewmodels/profile_viewmodel.dart';
import 'package:borderhacks/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget _buildCoverImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/doctor-background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage(ProfileViewmodel _model) {
    return Positioned(
      bottom: -106,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          Text(
            _model.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            _model.specialisation,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ProfileViewmodel _model) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildCoverImage(),
        _buildProfileImage(_model),
      ],
    );
  }

  Widget _buildInfo(IconData leading, String field, String value) {
    return ListTile(
      leading: Icon(
        leading,
        color: Colors.blue,
      ),
      title: Text('$field : $value'),
    );
  }

  Widget _buildProfileInfo(ProfileViewmodel _model) {
    return ListView(
      children: [
        _buildInfo(Icons.timer, 'Timing', _model.timing),
        _buildInfo(Icons.money, 'Appointment fees', 'Rs ${_model.fees}/-'),
        _buildInfo(Icons.location_city, 'Address', _model.address),
      ],
    );
  }

  Widget _buildProfile(ProfileViewmodel _model) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildHeader(_model),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(top: 120),
            child: _buildProfileInfo(_model),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewmodel>(
      onModelReady: (model) {
        model.fetchProfile();
      },
      builder: (context, model, child) {
        if (model.state == ViewState.Busy) {
          return Center(child: CircularProgressIndicator());
        }
        return _buildProfile(model);
      },
    );
  }
}
