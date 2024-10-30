import 'package:flutter/material.dart';
import 'package:store_apps/screens/SignInScreen.dart';
import 'package:store_apps/widgets/Align_text_widget.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/Custombutton.dart';
import 'package:store_apps/widgets/Customtextformfield.dart';

class NewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(
            text: 'New Password',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 10),
            child: CustomText(
              text:
                  'Your new password must be different from previously used password',
              maxlines: 2,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
              align: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const AlignText(text: 'Password'),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(),
          const SizedBox(
            height: 8,
          ),
          const AlignText(text: 'Confirm Password'),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
              height: 45,
              width: 350,
              child: CustomButton(
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignInScreen();
                    },
                  ));
                },
                text: 'Create New Password',
              )),
        ]),
      ),
    );
  }
}
