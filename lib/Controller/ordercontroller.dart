import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Map<String, dynamic>>[
    {
      "name": "Chicken Burger",
      "price": 20,
      "quantity": 1,
      "image": "assets/images/chicken_burger_order.png"
    },
    {
      "name": "Onion Pizza",
      "price": 15,
      "quantity": 1,
      "image": "assets/images/onion_pizza.png"
    },
    {
      "name": "Spicy Shawarma",
      "price": 15,
      "quantity": 1,
      "image": "assets/images/spics_shawarma.png"
    },
  ].obs; // ✅ Now it's reactive!

  void increment(int index) {
    orders[index]["quantity"] = (orders[index]["quantity"] ?? 0) + 1;
    orders.refresh(); // 🔄 Refresh to update UI
  }

  void decrement(int index) {
    if ((orders[index]["quantity"] ?? 0) > 1) {
      orders[index]["quantity"] = (orders[index]["quantity"] ?? 0) - 1;
      orders.refresh(); // 🔄 Refresh to update UI
    }
  }

  int getSubtotal(int index) {
    int price = (orders[index]["price"] ?? 0) as int;
    int quantity = (orders[index]["quantity"] ?? 0) as int;
    return price * quantity;
  }

  int get totalPrice {
    return orders.fold(0, (sum, item) {
      int price = (item["price"] ?? 0) as int;
      int quantity = (item["quantity"] ?? 0) as int;
      return sum + (price * quantity);
    });
  }
}
