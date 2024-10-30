import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

    final String text;
    final VoidCallback onpressed;

  const CustomButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[700]),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white
            ),
          )),
    );
  }
}