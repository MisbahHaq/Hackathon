import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends GetxController {
  var messages = [].obs;
  var isTyping = false.obs;

  void sendMessage(String message) {
    messages.add({'text': message, 'isUser': true});
    getResponse(message);
  }

  Future<void> getResponse(String message) async {
    isTyping.value = true;

    final response = await http.post(
      Uri.parse(
          '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'),
      body: jsonEncode({'message': message}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      messages.add({'text': data['response'], 'isUser': false});
    } else {
      messages
          .add({'text': "Sorry, I couldn't understand that.", 'isUser': false});
    }

    isTyping.value = false;
  }
}
