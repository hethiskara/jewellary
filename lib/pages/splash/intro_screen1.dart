import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get

import 'package:jewelleryapp/pages/login/login.dart';
import 'package:jewelleryapp/pages/splash/intro_screen2.dart';

class Intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background image

          // Content
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Larger image in the middle
                Image(
                  image: AssetImage("assets/intro1.png"),
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

          // Bottom section with smaller image, Skip, and Next button
          Positioned(
            bottom: 20,
            child: Column(
              children: [
                // Smaller image at the bottom
                Image(
                  image: AssetImage("assets/intro1bottom.png"),
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 0),
                    // Skip button
                    TextButton(
                      onPressed: () {
                        Get.off(
                            () => LoginPage()); // Use Get.off for replacement
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 87, 87, 87)),
                      ),
                    ),
                    SizedBox(width: 250),

                    // Next button with round icon
                    InkWell(
                      onTap: () {
                        Get.to(() => Intro2()); // Use Get.to for navigation
                        // Handle next action
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
