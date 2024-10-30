import 'package:flutter/material.dart';
import 'package:store_apps/models/product_model.dart';
import 'package:store_apps/screens/home_screen.dart';
import 'package:store_apps/screens/login.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/Customtextformfield.dart';

class StartPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SizedBox(height: 900,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> Login())
          );
    },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.brown[700]
              ),
              child: Center(
                child: const CustomText(
                  text: 'f',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                       fontSize: 30,
                       color: Colors.white
                  ),
                  align: TextAlign.center,
                ),
              )
            ),
            const SizedBox(width: 12,),
            const CustomText(
                text: 'Fashion',
                style:  TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            ),
            const CustomText(
               text: '.',
               style:  TextStyle(
                 fontSize: 40,
                 fontWeight: FontWeight.bold,
                 color: Colors.brown,
               ),
           )
          ],
        ),
       ),
    ),
    );
  }
}