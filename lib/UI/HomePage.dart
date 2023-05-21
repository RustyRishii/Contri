import 'package:contri/UI/Landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                    child: Container(
                        height: 200,
                        child: Image.asset("Assets/Images/Contri.png"))),
                //Image
                TextButton(
                    onPressed: () async {
                      {
                        final SharedPreferences PhonePreferences =
                            await SharedPreferences.getInstance();
                        PhonePreferences.remove("PhoneNumber");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Landing_page()));
                      }
                    },
                    style: TextButton.styleFrom(
                        // fixedSize: const Size(double.infinity, 40),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((20))),
                        backgroundColor:
                            const Color.fromRGBO(160, 165, 228, 1)),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 20,
                          color: Colors.white),
                    )),
                //Logout button
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular((20))),
                              backgroundColor:
                                  const Color.fromRGBO(160, 165, 228, 1)),
                          child: const Text(
                            "Send Notification",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 20,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}