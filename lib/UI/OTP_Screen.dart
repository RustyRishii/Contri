  import 'package:contri/Components/BarWidget.dart';
  import 'package:contri/UI/NameInput_Screen.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
  import 'package:http/http.dart' as http;
  import 'package:contri/constants.dart';
  
  class OTP_Screen extends StatelessWidget {
    OTP_Screen({Key? key}) : super(key: key);
  
    var url = Uri.parse("https://dummyjson.com/http/200/Verified");

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BarWidget(),
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "Please Enter the OTP",
                  style: TextStyle(fontFamily: "WorkSans", fontSize: 30),
                ), //Please enter OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OtpTextField(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      textStyle: TextStyle(fontSize: 30),
                      borderWidth: 2,
                      autoFocus: true,
                      numberOfFields: 4,
                      borderColor: Colors.black,
                    ),
                    TextField(),
                  ],
                ), //OTP Input
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                    onPressed: () async {
                      {
                        var response = await http.post(url, body: {
                          "mobile: !$kPhoneNumberController",
                          "OTP: !$kOTPText"
                        });
                        if(response.statusCode == 200)
                          {
                            print(response.body);
                          }
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Name_Screen()));
                    },
                    style: TextButton.styleFrom(
                        // fixedSize: const Size(double.infinity, 40),
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((20))),
                        backgroundColor: const Color.fromRGBO(160, 165, 228, 1)),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 15,
                          color: Colors.white),
                    )), //Verify button
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size(100, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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
                                borderRadius: BorderRadius.circular(15)),
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
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
