import 'package:borderhacks/viewmodels/profile_viewmodel.dart';
import 'package:borderhacks/views/base_view.dart';
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

  Widget _buildProfileImage() {
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
            'John Doe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Nuerologist & Gyanacologist',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildCoverImage(),
        _buildProfileImage(),
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

  Widget _buildProfileInfo() {
    return ListView(
      children: [
        _buildInfo(Icons.timer, 'Timing', '8:00AM - 5:00PM'),
        _buildInfo(Icons.money, 'Appointment fees', 'Rs 1000000000000/-'),
        _buildInfo(Icons.location_city, 'Address', 'Kahi nhi'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewmodel>(
      builder: (context, model, child) => Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildHeader(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 120),
              child: _buildProfileInfo(),
            ),
          )
        ],
      ),
    );
  }
}
