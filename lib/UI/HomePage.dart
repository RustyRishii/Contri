import 'package:contri/UI/Landing_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                  child: Container(
                      height: 200,
                      child: Image.asset("Assets/Images/Contri.png"))),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Landing_page()));
                  },
                  style: TextButton.styleFrom(
                      // fixedSize: const Size(double.infinity, 40),
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((20))),
                      backgroundColor: const Color.fromRGBO(160, 165, 228, 1)),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontFamily: "WorkSans",
                        fontSize: 20,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}