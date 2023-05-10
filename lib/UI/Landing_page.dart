import 'package:flutter/material.dart';
import 'package:contri/UI/SignUp_Page.dart';

class Landing_page extends StatelessWidget {
  const Landing_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Image.asset("Assets/Images/Contri.png")),
              const Text(
                "MONEY \n POOLS \n MADE \n EASY :)",
                style: TextStyle(
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp_Page()));
                      },
                      style: TextButton.styleFrom(
                          fixedSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((20))),
                          backgroundColor:
                              const Color.fromRGBO(75, 81, 217, 1)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.white),
                      )), //SignUp Button
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((20))),
                          backgroundColor:
                              const Color.fromRGBO(224, 228, 242, 1)),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Color.fromRGBO(75, 81, 217, 1)),
                      )), //Login Button
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
