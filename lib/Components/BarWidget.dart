import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Image.asset(
                "Assets/Images/Contri.png",
                width: 50,
              )),
          GestureDetector(
              onTap: () {
                launchUrl("Contri.co.in" as Uri);
              },
              child: const Text("What is Contri?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "WorkSans",
                    color: Color.fromRGBO(75, 81, 217, 1),
                  ))),
        ],
      ),
    );
  }
}
