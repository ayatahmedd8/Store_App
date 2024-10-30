import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_apps/screens/SignUp_screen.dart';
import 'package:store_apps/screens/completeProfile.dart';
import 'package:store_apps/screens/new_password.dart';
import 'package:store_apps/widgets/Align_text_widget.dart';
import 'package:store_apps/widgets/CustomRawMaterialButton.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/CustomTextButton.dart';
import 'package:store_apps/widgets/Divider_widget.dart';
import 'package:store_apps/widgets/Custombutton.dart';
import 'package:store_apps/widgets/Customtextformfield.dart';

class SignInScreen extends StatelessWidget{

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
                  text: 'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top: 12),
                child: CustomText(
                  text: 'Hi Welcom back, You\'ve been missed',
                  align: TextAlign.center,
                )
              ),
              const SizedBox(height: 24,),
              const AlignText(text: 'Email'),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              const AlignText(text: 'Password'),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  onpressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewPassword();
                  },));},
                  text: 'Forgot Password',
                  )
              ),
              const SizedBox(height: 24,),
              CustomButton(text: 'Sign In', onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CompleteProfile();
                },));
              }),
              const SizedBox(height: 36,),
              const DividerWidget(text: 'Or sign in with'),
              const SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRawMaterialButton(image: 'assets/img.png', onpressed: (){}),
                  const SizedBox(width:  10,),
                  CustomRawMaterialButton(image: 'assets/img_1.png', onpressed: (){}),
                  const SizedBox(width: 10,),
                  CustomRawMaterialButton(image: 'assets/img_2.png' , onpressed: (){})
                ],
              ),
              const SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text:'Dont\'t have an account?',
                       style:  TextStyle(
                           color: Colors.black
                       ),
                  ),
                  CustomTextButton(
                       onpressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                     },));
                    },
                    text: 'Sign Up'
                   )  ,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
