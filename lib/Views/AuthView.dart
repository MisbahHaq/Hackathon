import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/AuthController.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Slider2.png'),
                    opacity: 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (controller.isLogin.value) {
                                  controller.toggleForm();
                                }
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  color: !controller.isLogin.value
                                      ? Colors.red
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (!controller.isLogin.value) {
                                  controller.toggleForm();
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: controller.isLogin.value
                                      ? Colors.red
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (!controller.isLogin.value) ...[
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (controller.isLogin.value) {
                                  controller.signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                } else {
                                  controller.signUp(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                controller.isLogin.value ? "Login" : "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
