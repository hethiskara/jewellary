import 'package:flutter/material.dart';
import 'package:jewelleryapp/pages/login/login.dart';
import 'package:jewelleryapp/pages/splash/intro_screen3.dart';

class Intro4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background image

                // Content
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Larger image in the middle
                      Image(
                        image: AssetImage("assets/intro2.png"),
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 10),

                      // Bold heading
                      Text(
                        'Discover Jewels as Unique as Your Love',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),

                      // Description text
                      Text(
                        'Explore our collection and find the jewel that resonates with your unique bond.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 117, 117, 117),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom section with smaller image, Skip, and Next button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Smaller image at the bottom
                Image(
                  image: AssetImage("assets/intro4bottom.png"),
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Intro3(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                    ),

                    // Skip button
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 87, 87, 87)),
                      ),
                    ),

                    // Next button with round icon
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                        // Handle next action if needed
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(
                              255, 255, 105, 105), // Set your desired color
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
