import 'package:flutter/material.dart';
import 'package:food_delivery_app/Views/ChatView.dart';
import 'package:food_delivery_app/Views/profileview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 3) {
      Get.to(() => ChatScreen()); 
    }
    if (index == 1) {
      Get.to(() => ProfileScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home, "Home", 0),
          navItem(Icons.person, "Profile", 1),
          navItem(Icons.shopping_cart, "Cart", 2, hasNotification: true),
          navItem(Icons.chat, "Messages", 3, hasNotification: true),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index,
      {bool hasNotification = false}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          children: [
            Stack(
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.pink : Colors.grey,
                  size: 28,
                ),
                if (hasNotification)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
