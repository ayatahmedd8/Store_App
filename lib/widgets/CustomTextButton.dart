import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget{

  final VoidCallback onpressed;
  final String text;

  const CustomTextButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown[700],
              decoration: TextDecoration.underline,
              decorationColor: Colors.brown[700]
          ),
        )
    );
  }
}