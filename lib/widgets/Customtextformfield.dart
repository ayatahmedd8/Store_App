import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       decoration: InputDecoration(
         contentPadding: const EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
         border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(60)
        ),
      ),
    );
  }
}