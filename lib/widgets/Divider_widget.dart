import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget{

  final String text;

  const DividerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.black,
              thickness: 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12),
            child: Text(
              text,
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black,
              thickness: 0.3,
            ),
          )
        ],
      ),
    );
  }
}