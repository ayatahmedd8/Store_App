import 'package:flutter/material.dart';

class CustomTextFieldd extends StatelessWidget{

  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;

  CustomTextFieldd({super.key ,this.obscureText,this.hintText,this.onChanged, this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText!,
        onChanged: onChanged,
        decoration: InputDecoration(
        hintText: hintText,
        enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8)
              ) ,
      border:OutlineInputBorder(
        borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8)
       )
      )
    );
  }
}