import 'package:contri/Components/BarWidget.dart';
import 'package:contri/UI/HomePage.dart';
import 'package:flutter/material.dart';

class Name_Screen extends StatelessWidget {
  Name_Screen({Key? key}) : super(key: key);

  final TextEditingController NameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BarWidget(),
              const SizedBox(height: 50),
              const Text(
                "Enter your Name",
                style: TextStyle(fontFamily: "WorkSans", fontSize: 25),
              ),
              const SizedBox(height: 50),
              TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.white, fontFamily: "WorkSans"),
                autofocus: true,
                controller: NameController,
                decoration: const InputDecoration(
                    hintText: "Your name",
                    hintStyle:
                        TextStyle(fontFamily: "WorkSans", color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Please note that this name will be visible in all pools that you are a part of.",
                style: TextStyle(fontFamily: "WorkSans", fontSize: 22),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: TextButton.styleFrom(
                      // fixedSize: const Size(double.infinity, 40),
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((20))),
                      backgroundColor: const Color.fromRGBO(160, 165, 228, 1)),
                  child: const Text(
                    "Get Started",
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
