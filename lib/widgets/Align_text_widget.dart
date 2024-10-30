import 'package:flutter/material.dart';

class AlignText extends StatelessWidget{

  final String text;

  const AlignText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}