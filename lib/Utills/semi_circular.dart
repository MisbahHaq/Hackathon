import 'dart:math';
import 'package:flutter/material.dart';

class SemiCircularSlider extends StatefulWidget {
  const SemiCircularSlider({super.key});

  @override
  _SemiCircularSliderState createState() => _SemiCircularSliderState();
}

class _SemiCircularSliderState extends State<SemiCircularSlider> {
  double angle = pi / 2;
  double radius = 180;
  Offset center = Offset.zero;

  final List<String> pizzaImages = [
    "Assets/Images/Frame 356.png",
    "Assets/Images/Frame 357.png",
    "Assets/Images/Frame 358.png",
    "Assets/Images/Frame 361.png",
    "Assets/Images/Frame 361 (1).png",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    center = Offset(screenWidth / 2, screenHeight - 130);
  }

  void _updateAngle(Offset local) {
    double dx = local.dx - center.dx;
    double dy = center.dy - local.dy;
    double newAngle = atan2(dy, dx);

    if (newAngle >= 0 && newAngle <= pi) {
      setState(() => angle = newAngle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background Image and Top Pizza Image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      "Assets/Images/Price Info.png",
                      width: screenWidth,
                    ),
                    Positioned(
                      top: 110,
                      child: Image.asset(
                        "Assets/Images/image 8.png",
                        width: screenWidth * 0.6,
                      ),
                    ),
                  ],
                ),
              ),

              // Pizza Information and Shop Button
              Positioned(
                top: screenHeight * 0.45,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    const Text(
                      "Farmhouse",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Large | \$89",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Tomato, Mozzarella, Green basil, Olives, Bell Pepper.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Shop",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),

              // Semi-circular Slider Background
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: screenWidth * 1.2,
                  height: 160,
                  child: CustomPaint(
                    painter: SemiCirclePainter(),
                  ),
                ),
              ),

              // Rotating Pizza Images
              ...List.generate(pizzaImages.length, (index) {
                double itemAngle = angle + (pi / 4) * (index - 2);
                double itemX = center.dx + radius * cos(itemAngle) - 115;
                double itemY = center.dy - radius * sin(itemAngle) + 25;

                return Positioned(
                  left: itemX,
                  top: itemY,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      RenderBox? box = context.findRenderObject() as RenderBox?;
                      if (box != null) {
                        Offset local =
                            box.globalToLocal(details.globalPosition);
                        _updateAngle(local);
                      }
                    },
                    child: Image.asset(
                      pizzaImages[index],
                      width: 150,
                      height: 150,
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

// Custom Semi-Circular Slider Painter
class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = const Color.fromRGBO(255, 172, 172, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Rect outerRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 1.2),
      width: size.width * 1.2,
      height: size.height * 3.2,
    );

    Rect middleRect = outerRect.deflate(outerRect.width * 0.24);
    Rect innerRect = middleRect.deflate(middleRect.width * 0.15);

    canvas.drawArc(outerRect, pi, pi, true, redPaint);
    canvas.drawArc(middleRect, pi, pi, true, whitePaint);
    canvas.drawArc(middleRect, pi, pi, true, borderPaint);
    canvas.drawArc(innerRect, pi, pi, true, whitePaint);

    _drawDottedArc(canvas, innerRect);
  }

  void _drawDottedArc(Canvas canvas, Rect rect) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(255, 172, 172, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    double dashLength = 8;
    double gapLength = 6;
    double totalLength = rect.width * pi / 2;
    double startAngle = pi;

    for (double i = 0; i < totalLength; i += dashLength + gapLength) {
      double angle1 = startAngle + (i / totalLength) * pi;
      double angle2 = startAngle + ((i + dashLength) / totalLength) * pi;
      if (angle2 > startAngle + pi) angle2 = startAngle + pi;

      Offset startPoint = Offset(
        rect.center.dx + (rect.width / 2) * cos(angle1),
        rect.center.dy + (rect.height / 2) * sin(angle1),
      );
      Offset endPoint = Offset(
        rect.center.dx + (rect.width / 2) * cos(angle2),
        rect.center.dy + (rect.height / 2) * sin(angle2),
      );

      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
