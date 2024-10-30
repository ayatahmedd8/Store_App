import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_apps/screens/SignInScreen.dart';
import 'package:store_apps/screens/completeProfile.dart';
import 'package:store_apps/widgets/Align_text_widget.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/CustomTextButton.dart';
import 'package:store_apps/widgets/Divider_widget.dart';
import 'package:store_apps/widgets/CustomRawMaterialButton.dart';
import 'package:store_apps/widgets/Custombutton.dart';
import 'package:store_apps/widgets/Customtextformfield.dart';

class SignUpScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              const CustomText(
                  text: 'Create Account',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
              ),
               const Padding(
                  padding: EdgeInsets.only(left: 40,right: 40,top: 12),
                    child: Center(
                      child: CustomText(
                          text:  'Fill your information below or register with your social account.',
                          maxlines: 2,
                          align: TextAlign.center,
                         ),
                    )
                ),
              const SizedBox(height: 24,),
              const AlignText(text: 'Name'),
              const SizedBox(height: 6,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              const AlignText(text: 'Email'),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              const AlignText(text: 'Password'),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Icon(
                    color: Colors.brown[700],
                    Icons.check_box
                  ),
                  const CustomText(text: 'Agree with'),
                  const CustomText(
                    text: 'Tearms & Condition',
                    style: TextStyle(
                        color: Colors.brown,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.brown
                    ),
                  )
                ],
              ),
              const SizedBox(height: 18,),
              CustomButton(text: 'Sign Up', onpressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CompleteProfile();
                },));
              }),
              const SizedBox(height: 20,),
              const DividerWidget(text: 'Or sign up with'),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRawMaterialButton(image: 'assets/img.png', onpressed: (){}),
                  const SizedBox(width:  10,),
                  CustomRawMaterialButton(image: 'assets/img_1.png', onpressed: (){}),
                  const SizedBox(width: 10,),
                  CustomRawMaterialButton(image: 'assets/img_2.png', onpressed: (){}),
                ],
              ),
              const SizedBox(height: 10,),
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
                      },));
                        },
                      text: 'Sign In'
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}