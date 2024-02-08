import 'package:flutter/material.dart';
import 'package:jewelleryapp/pages/splash/intro_screen1.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Intro1(),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(207, 255, 74, 86),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
            ),
            SizedBox(height: 16),
            Text(
              "GOLD JEWELLERY",
              style: TextStyle(
                fontFamily: 'Averia Serif Libre',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 254, 254),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
