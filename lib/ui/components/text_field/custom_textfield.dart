import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final Icon? prefix;
  final String? Function(String?)? _validator;
  final IconButton? _suffix;
  final int? _maxlines;
  final bool _isHidden;

  const CustomTextField(
      {required this.controller,
      required this.label,
      this.hint,
      this.prefix,
      IconButton? suffix,
      bool isHidden = false,
      int maxlines = 1,
      Key? key,
      String? Function(String?)? validator})
      : _suffix = suffix,
        _maxlines = maxlines,
        _isHidden = isHidden,
        _validator = validator,
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget._isHidden,
      controller: widget.controller,
      validator: widget._validator,
      maxLines: widget._maxlines,
      style: const TextStyle(fontSize: 18.0),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          focusColor: Colors.white,
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.blue)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: widget.prefix,
          suffixIcon: widget._suffix),
    );
  }
}
