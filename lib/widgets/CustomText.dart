import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{

  final String text;
  final TextStyle? style;
  final int? maxlines;
  final TextAlign? align;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.maxlines, this.align
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxlines,
    );
  }
}