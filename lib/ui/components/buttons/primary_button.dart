import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final bool isFilled;

  const PrimaryButton({
    required this.press,
    required this.text,
    required this.isFilled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(12.0),
      color: isFilled ? Colors.blue : Colors.white,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
        side: const BorderSide(color: Colors.blue),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: isFilled ? Colors.white : Colors.blue,
        ),
      ),
    );
  }
}
