import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/Price Info.png")),
            Image.asset("assets"),
          ],
        ),
      ),
    );
  }
}
