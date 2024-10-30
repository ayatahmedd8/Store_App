import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_apps/screens/SignUp_screen.dart';
import 'package:store_apps/screens/SignInScreen.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/CustomTextButton.dart';
import 'package:store_apps/widgets/Custombutton.dart';

class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: [
              Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 12),
                  child: Container(
                    width: 165,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:  AssetImage(
                            'assets/WhatsApp Image 2024-10-04 at 22.19.16_7f309268.jpg',
                        ),
                    ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80,left: 6,right: 6,bottom: 6),
                      child: Container(
                        width: 150,
                        height: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(900),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:  AssetImage(
                              'assets/WhatsApp Image 2024-10-04 at 21.22.39_63227f62.jpg',
                            )
                          ),
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(400),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:  AssetImage(
                          'assets/WhatsApp Image 2024-10-04 at 21.22.39_14bb4965.jpg',
                        ),
                      ),
                    ),
                  ),
                )
                    ]
                )
              ],
             ),
           const SizedBox(height: 32,),
           const Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomText(
                 text: 'The',
                 style: TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),
               ),
               CustomText(
                 text: 'Fashion App',
                 style: TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                     color: Colors.brown
                 ),
               ),
               CustomText(
                 text: ' That',
                 style: TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),
               ),
            ]
           ),
           const CustomText(
             text: ' Makes You Look Your Best',
             style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                 color: Colors.black
             ),
           ),
           const Spacer(flex: 1,),
           CustomButton(text: 'Let\'s Get Started', onpressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) {
               return SignUpScreen();
             },));
           }),
           const SizedBox(height: 8),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const CustomText(
                   text: 'Already have an account?',
                   style: TextStyle(
                     color: Colors.black
                   ),
                 ),
                 CustomTextButton(
                     onpressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return SignInScreen();
                     },));},
                     text: 'Sign In'
                 )
               ],
             ),
            ]
      ),
    );
  }
}