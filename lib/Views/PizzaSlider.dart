import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaController extends GetxController {
  var selectedPizzaIndex = 0.obs;

  final pizzas = [
    {
      'name': 'Farmhouse',
      'price': '\$89',
      'ingredients': 'Tomato, Mozzarella, Green basil, Olives, Bell pepper',
      'image': 'Assets/Images/image 8.png'
    },
    {
      'name': 'Chicken',
      'price': '\$95',
      'ingredients': 'Chicken, Cheese, Olives',
      'image': 'Assets/Images/image 8.png'
    },
    {
      'name': 'Tomato',
      'price': '\$75',
      'ingredients': 'Tomato, Cheese, Basil',
      'image': 'Assets/Images/image 8.png'
    },
    {
      'name': 'Strawberry',
      'price': '\$99',
      'ingredients': 'Strawberry, Cream, Chocolate',
      'image': 'Assets/Images/image 8.png'
    },
  ];

  void selectPizza(int index) {
    selectedPizzaIndex.value = index;
  }
}

class PizzaScreen extends StatelessWidget {
  final PizzaController controller = Get.put(PizzaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top background section
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  'Pizza Party',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Pizza image in the center
            Expanded(
              flex: 4,
              child: Obx(() {
                var pizza =
                    controller.pizzas[controller.selectedPizzaIndex.value];
                return Center(
                  child: Image.asset(
                    pizza['image']!,
                    height: 200,
                  ),
                );
              }),
            ),
            // Pizza details section
            Expanded(
              flex: 3,
              child: Obx(() {
                var pizza =
                    controller.pizzas[controller.selectedPizzaIndex.value];
                return Column(
                  children: [
                    Text(
                      pizza['name']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pizza['price']!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        pizza['ingredients']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: StadiumBorder(),
                      ),
                      child: Text('Shop'),
                    )
                  ],
                );
              }),
            ),
            // Circular slider at the bottom
            Container(
              height: 100,
              child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.pizzas.length,
                  itemBuilder: (context, index) {
                    var pizza = controller.pizzas[index];
                    bool isSelected =
                        index == controller.selectedPizzaIndex.value;
                    return GestureDetector(
                      onTap: () => controller.selectPizza(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: isSelected ? 35 : 30,
                              backgroundColor: isSelected
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              backgroundImage: AssetImage(pizza['image']!),
                            ),
                            SizedBox(height: 5),
                            Text(
                              pizza['name']!,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
