import 'package:borderhacks/ui/components/text_field/custom_textfield.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required TextEditingController passwordController,
    Key? key,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isHidden = true;

  String? validatePasswordField(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget._passwordController,
      label: 'Password',
      prefix: const Icon(Icons.lock),
      hint: 'Enter the Password',
      validator: validatePasswordField,
      isHidden: _isHidden,
      suffix: IconButton(
        icon: _isHidden
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
      ),
    );
  }
}
