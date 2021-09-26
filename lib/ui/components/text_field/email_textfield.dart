import 'package:borderhacks/ui/components/text_field/custom_textfield.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {required TextEditingController emailController, Key? key})
      : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  String? validateUsernameField(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _emailController,
      label: 'Username',
      prefix: const Icon(Icons.person),
      hint: 'Enter the Username',
      validator: validateUsernameField,
    );
  }
}
