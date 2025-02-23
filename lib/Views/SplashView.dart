import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/Splashcontroller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔥 Background Image (30% Height)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_pattern.jpeg'),
                  opacity: 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'Assets/Images/SplashBike.png',
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'Food Couriers',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins-ExtraBold',
                    color: const Color.fromARGB(255, 245, 16, 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
