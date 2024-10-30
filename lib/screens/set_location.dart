import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Add this import
import 'package:store_apps/models/product_model.dart';
import 'package:store_apps/screens/home_screen.dart';
import 'package:store_apps/widgets/CustomText.dart';
import 'package:store_apps/widgets/CustomTextButton.dart';
import 'package:store_apps/widgets/Custombutton.dart';

class SetLocation extends StatefulWidget {
  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 80),
        child: Column(
          children: [
            const SizedBox(height: 120),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(90),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.location_on,
                  color: Colors.brown,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CustomText(
              text: 'What is Your Location?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const CustomText(
              text: 'We need to know your location in order to suggest nearby services',
              maxlines: 2,
              align: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 34),
            CustomButton(
              text: 'Allow Location Access',
              onpressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              },));
              },
            ),
            const SizedBox(height: 26),
            CustomTextButton(
              onpressed: () {
                // Handle manual location entry
              },
              text: 'Enter Location Manually',
            ),
          ],
        ),
      ),
    );
  }
}