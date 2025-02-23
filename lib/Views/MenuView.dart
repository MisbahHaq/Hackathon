import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utills/CustomBottomNavBar.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var meals = [
    {
      'name': 'Chicken Spagetti',
      'description': '1 Big Pack',
      'price': '\$7',
      'image': 'Assets/Images/Menu1.png'
    },
    {
      'name': 'Jollof Rice',
      'description': '1 Combo Pack',
      'price': '\$10',
      'image': 'Assets/Images/Menu2.png'
    },
    {
      'name': 'Fruity Pancakes',
      'description': 'Noodle Home',
      'price': '\$12',
      'image': 'Assets/Images/Menu3.png'
    },
    {
      'name': 'Pepper Pizza',
      'description': '5kg Box of Pizza',
      'price': '\$15',
      'image': 'Assets/Images/Menu4.png'
    },
  ].obs;

  var filteredMeals = [].obs;

  @override
  void onInit() {
    super.onInit();
    filteredMeals.value = meals; // Initially, all meals are shown
  }

  void filterMeals(String query) {
    if (query.isEmpty) {
      filteredMeals.value = meals;
    } else {
      filteredMeals.value = meals
          .where((meal) =>
              meal['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

class MealMenuScreen extends StatelessWidget {
  final MenuController menuController = Get.put(MenuController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'Assets/Images/Pattern.png',
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.redAccent),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications,
                              color: Colors.redAccent),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Meal Menu",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        menuController.filterMeals(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search, color: Colors.redAccent),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: menuController.filteredMeals.length,
                          itemBuilder: (context, index) {
                            var meal = menuController.filteredMeals[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                leading: Image.asset(
                                  meal['image']!,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                  meal['name']!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(meal['description']!),
                                trailing: Text(
                                  meal['price']!,
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
