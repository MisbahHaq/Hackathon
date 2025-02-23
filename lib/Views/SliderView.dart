import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/SliderController.dart';
import 'package:get/get.dart';

class SliderView extends StatelessWidget {
  final SliderController controller = Get.put(SliderController());

  final List<Map<String, String>> slides = [
    {
      "image": "assets/images/Slider1.png",
      "title": "Select the ",
      "Sub-title": "Favorites Menu",
      "description":
          "Now eat well, don't leave the house,You can choose your favorite food only with one click"
    },
    {
      "image": "assets/images/Slider2.png",
      "title": "Quick Delivery",
      "Sub-title": "",
      "description":
          "You can eat at expensive restaurants with affordable price"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: controller.currentIndex.value == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == index
                          ? Colors.red
                          : const Color.fromARGB(255, 83, 83, 83),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentIndex.value = index;
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(slides[index]["image"]!, height: 250),
                      SizedBox(height: 30),
                      Text(
                        slides[index]["title"]!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        slides[index]["Sub-title"]!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          slides[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.skip(),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.nextPage(slides.length),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 17, 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
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
