import 'package:flutter/material.dart';

class BurgerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> burger;

  const BurgerDetailScreen({super.key, required this.burger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            Stack(
              children: [
                Image.asset(
                  burger['image'],
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            // Details Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Popular tag and favorite icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Popular",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(Icons.favorite_border, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Burger Name
                  Text(
                    burger['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Rating and Orders
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text("4.8 Rating"),
                      SizedBox(width: 20),
                      Icon(Icons.shopping_bag, size: 20, color: Colors.grey),
                      SizedBox(width: 5),
                      Text("7000+ Orders"),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Description
                  Text(
                    burger['description'] ??
                        "A delicious and juicy burger packed with fresh ingredients and flavors.",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  SizedBox(height: 30),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(214, 19, 85, 1),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Back Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.pinkAccent),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
