import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class OrderCompletedPage extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),

                // Centered check icon
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.check, color: Colors.white, size: 40),
                ),
                SizedBox(height: 20),

                Text(
                  "Thank You!\nOrder Completed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Text(
                  "Please rate your last Driver",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 15),

                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print("User rating: $rating");
                  },
                ),
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: feedbackController,
                    decoration: InputDecoration(
                      hintText: "Leave feedback",
                      prefixIcon: Icon(Icons.edit, color: Colors.redAccent),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          "Submitted",
                          "Thank you for your feedback!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Updated border radius
                          ),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Get.snackbar("Skipped", "Rating skipped successfully");
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.redAccent, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
