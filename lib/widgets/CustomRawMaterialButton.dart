import 'package:flutter/material.dart';

class CustomRawMaterialButton extends StatelessWidget{

  final String image;
  final VoidCallback onpressed;

  const CustomRawMaterialButton({super.key, required this.image, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(12),
      shape: const CircleBorder(),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.cover,
        height: 24,
      ),
    );
  }
}