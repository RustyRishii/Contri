import 'package:contri/Components/BarWidget.dart';
import 'package:contri/UI/Name_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTP_Screen extends StatelessWidget {
  const OTP_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BarWidget(),
              SizedBox(
                height: 50,
              ),
              const Text(
                "Please Enter the OTP",
                style: TextStyle(fontFamily: "WorkSans", fontSize: 30),
              ),
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
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: () {
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
                  )),
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
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(270, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Color.fromRGBO(224, 228, 242, 1)),
                      onPressed: () {
                      },
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
