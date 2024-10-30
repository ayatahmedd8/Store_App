import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:store_apps/screens/SignUp_screen.dart';
import 'package:store_apps/screens/set_location.dart';
import 'package:store_apps/widgets/Align_text_widget.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/Custombutton.dart';
import 'package:store_apps/widgets/Customtextformfield.dart';

class CompleteProfile extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.9,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        },));
                      },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const CustomText(
                text: 'Complete Your Profile',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              const  CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 75,
                  child: FittedBox(
                    child: Icon(
                      Icons.account_circle,
                      size: 130,
                      color: Colors.grey,
                    ),
                  ),
                ),
              const SizedBox(height: 16,),
              const AlignText(text: 'Name'),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              const AlignText(text: 'Phone Number'),
              const SizedBox(height: 8,),
              IntlPhoneField(
                dropdownIconPosition: IconPosition.trailing,
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  contentPadding: const EdgeInsets.fromLTRB(50,10,50,10),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(60)
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              const SizedBox(height: 8,),
              const AlignText(text: 'Gender'),
              CustomTextFormField(),
              const SizedBox(height: 8,),
              const SizedBox(height: 30,),
              CustomButton(text: 'Complete Profile', onpressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SetLocation();
                },));
              }),
                ],
          ),
        ),
      ),
    );
  }
}