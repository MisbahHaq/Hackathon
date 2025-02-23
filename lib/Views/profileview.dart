import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profile_logo_image.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                          color: Color.fromRGBO(214, 19, 85, 1),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white, size: 16),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Personal Info",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      buildInfoRow("Your name", "Joyce Johnson"),
                      buildInfoRow("Occupation", "Manager"),
                      buildInfoRow("Employer", "Food Couriers"),

                      // Toggle Switch Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pakistan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Switch(
                            value: isSwitched,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Contact Info Card
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Info",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      buildInfoRow("Phone number", "+234 813 0400 445"),
                      buildInfoRow("Email", "okamcy@mail.com"),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Edit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(214, 19, 85, 1),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: Text("Edit",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create info rows
  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
