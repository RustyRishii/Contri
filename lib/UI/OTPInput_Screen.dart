import 'package:contri/Components/BarWidget.dart';
import 'package:contri/UI/NameInput_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:contri/constants.dart';

import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);

  var url = Uri.parse("https://dummyjson.com/http/200/Verified");
  var bodyrequest = {
    "mobile": kPhoneNumberController.text,
    "OTP": MainOTPController.text,
  };

  //TextEditingController OTPController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BarWidget(),
                const SizedBox(height: 50),
                const Text(
                  "Please Enter the OTP",
                  style: TextStyle(fontFamily: "WorkSans", fontSize: 30),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: MainOTPController,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "WorkSans",
                          fontSize: 25),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 5, color: Colors.purple)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                TextButton(
                    onPressed: () async {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Name_Screen()));
                      }
                      {
                        var response = await http.post(url, body: bodyrequest);
                        if (response.statusCode == 200) {
                          print(response.body);
                          print("OTP page works");
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                        // fixedSize: const Size(double.infinity, 40),
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((20))),
                        backgroundColor:
                            const Color.fromRGBO(160, 165, 228, 1)),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 15,
                          color: Colors.white),
                    )), //Verify button
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size(100, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromRGBO(224, 228, 242, 1)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                              fontFamily: "WorkSans",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )), //Back Button
                    TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size(270, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromRGBO(224, 228, 242, 1)),
                        onPressed: () {},
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              fontFamily: "WorkSans",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )), //Resend Code button
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}