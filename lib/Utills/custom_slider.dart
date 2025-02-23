import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.95);

  final List<String> images = [
    'assets/images/corosol_slider.png',
    'assets/images/corosol_slider.png',
    'assets/images/corosol_slider.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              bool isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(
                    horizontal: 8, vertical: isActive ? 0 : 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              width: _currentIndex == index ? 12 : 9,
              height: 9,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(255, 0, 0, 1)
                    : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
