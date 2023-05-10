import 'package:contri/UI/OTP_Screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contri/Components/BarWidget.dart';
import '';

class SignUp_Page extends StatelessWidget {
  SignUp_Page({Key? key}) : super(key: key);

  final Uri Website = Uri(path: "https://www.contri.co.in/");
  TextEditingController PhoneNumber = TextEditingController();

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
                  const Text(
                    "Your Phone Number",
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  TextField(
                    controller: PhoneNumber,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "e.g. (+91 1234567890)",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Colors.purple)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Messages and data rates may apply",
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTP_Screen()));
                      },
                      style: TextButton.styleFrom(
                          // fixedSize: const Size(double.infinity, 40),
                          minimumSize: Size.fromHeight(50),
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
                      )),
                ],
              ), //Phone number input field and Next button
            ],
          ),
        ),
      ),
    );
  }
}
