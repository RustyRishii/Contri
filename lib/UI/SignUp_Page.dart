import 'package:contri/UI/OTP_Screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contri/Components/BarWidget.dart';
import 'package:http/http.dart' as http;
import 'package:contri/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OTPInput_Screen.dart';

class SignUp_Page extends StatefulWidget {
  SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  final Uri Website = Uri(path: "https://www.contri.co.in/");

  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var requestBody = {"Mobile": kPhoneNumberController.text};
  bool isButtonEnabled = false;

  void OnTextChange()
  {
    setState(() {
      isButtonEnabled = kPhoneNumberController.text.length == 10;
    });
  }

  void OnButtonPress()
  async {
    {
      {
        final SharedPreferences PhonePreferences = await SharedPreferences.getInstance();
        PhonePreferences.setString("PhoneNumber", kPhoneNumberController.text);
      }
      {
        var response = await http.post(url, body: requestBody);
        if (response.statusCode == 200) {
          print(response.body);
          print("Works");
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  OTPScreen()));
      }
    }
    {
      print("saved");
    }
  }

  @override
  void initState() {
    super.initState();
    kPhoneNumberController.addListener(OnTextChange);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              BarWidget(),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Sign Up with your mobile phone number",
                style: TextStyle(
                    fontFamily: "WorkSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ), //Sign Up with your mobile phone number
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Your Phone Number",
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: 15,
                        color: Colors.grey),
                  ), //Your number
                  TextField(
                    controller: kPhoneNumberController,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "e.g. (+91 1234567890)",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Colors.purple)),
                    ),
                  ), //Phone number Input field
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Messages and data rates may apply",
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: 20,
                        color: Colors.grey),
                  ), // Data warning
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: isButtonEnabled ? OnButtonPress: null,
                      style: TextButton.styleFrom(
                          // fixedSize: const Size(double.infinity, 40),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((20))),
                          backgroundColor:
                              const Color.fromRGBO(160, 165, 228, 1)),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.white),
                      )), //Next Button
                ],
              ), //Phone number input field and Next button
            ],
          ),
        ),
      ),
    );
  }
}