import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/ChatController.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Pattern
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'Assets/Images/Pattern.png',
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Back button and Notification Icon
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.redAccent),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // Notification Icon
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.redAccent),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              "Chat",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Main Chat Body
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Expanded(
                  child: Obx(() => ListView.builder(
                        itemCount: chatController.messages.length,
                        itemBuilder: (context, index) {
                          var message = chatController.messages[index];
                          return Align(
                            alignment: message['isUser']
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: message['isUser']
                                    ? Colors.redAccent
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                message['text'],
                                style: TextStyle(
                                  color: message['isUser']
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
                // Typing Indicator
                Obx(() => chatController.isTyping.value
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Food Runs typing...",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink()),
                // Message Input Box
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        child: IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            if (messageController.text.isNotEmpty) {
                              chatController
                                  .sendMessage(messageController.text);
                              messageController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
