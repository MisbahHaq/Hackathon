import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/ordercontroller.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Order details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orderController.orders.length,
                itemBuilder: (context, index) {
                  final item = orderController.orders[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading:
                          Image.asset(item["image"], height: 50, width: 50),
                      title: Text(item["name"],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("\$${item["price"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline,
                                color: Colors.red),
                            onPressed: () => orderController.decrement(index),
                          ),
                          Text(
                            "${item["quantity"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline,
                                color: Colors.green),
                            onPressed: () => orderController.increment(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildPriceSummary(orderController),
      ),
    );
  }

  Widget _buildPriceSummary(OrderController controller) {
    return Obx(
      () {
        int subTotal = controller.totalPrice; // Dynamically calculated
        int deliveryCharge = 10;
        int discount = 10;
        int total = subTotal + deliveryCharge - discount;

        return Container(
          height: 220,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(214, 19, 85, 1),
                Color.fromRGBO(255, 0, 0, 1),
              ],
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/pattern_orders.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              _priceRow("Sub-Total", "\$${subTotal.toStringAsFixed(2)}"),
              _priceRow(
                  "Delivery Charge", "\$${deliveryCharge.toStringAsFixed(2)}"),
              _priceRow("Discount", "-\$${discount.toStringAsFixed(2)}"),
              Divider(color: Colors.white),
              _priceRow("Total", "\$${total.toStringAsFixed(2)}", isBold: true),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => print("Order Placed"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Place My Order", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _priceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
