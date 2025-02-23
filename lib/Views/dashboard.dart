import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utills/CustomBottomNavBar.dart';
import 'package:food_delivery_app/Utills/custom_slider.dart';
import 'package:food_delivery_app/Views/BurgerScreen.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

final List<Map<String, dynamic>> burgersList = [
  {
    "name": "Chicken Burger",
    "quantity": "100 gr chicken + tomato + cheese Lettuce",
    "price": "\$20.00",
    "image": "Assets/Images/chicken_burger.png",
  },
  {
    "name": "Cheese Burger",
    "quantity": "100 gr meat + onion + tomato + Lettuce cheese",
    "price": "\$15.00",
    "image": "Assets/Images/chicken_cheese_burger.png",
  },
];

class _DashboardScreenViewState extends State<DashboardScreenView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'Assets/Images/app_bar_background.png',
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Image.asset(
            'Assets/Images/app_bar_left_icon.png',
            width: 30,
            height: 30,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 20),
              SizedBox(width: 5),
              Text(
                "Gulshan e Iqbal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Search Bar
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 240, 240, 1),
                      Color.fromRGBO(255, 233, 233, 1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            //Expandable Content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //Carousel Slider
                    CustomCarouselSlider(),
                    SizedBox(height: 15),

                    //Horizontal List View
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildListItem('Assets/Images/burger_image.png',
                                'Burger', screenWidth),
                            buildListItem('Assets/Images/pizza_image.png',
                                'Pizza', screenWidth),
                            buildListItem('Assets/Images/sandwitch_image.png',
                                'Sandwich', screenWidth),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    //Burger List Grid (Fixed)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: (burgersList.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          int firstIndex = index * 2;
                          int secondIndex = firstIndex + 1;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child:
                                    BurgerCard(burger: burgersList[firstIndex]),
                              ),
                              SizedBox(width: 10),
                              if (secondIndex < burgersList.length)
                                Expanded(
                                    child: BurgerCard(
                                        burger: burgersList[secondIndex]))
                              else
                                Expanded(child: SizedBox()),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // row for text popular and see all
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Meal Menu',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: ListTile(
                          leading: Image(
                            image: AssetImage('Assets/Images/pizza_pop.png'),
                            height: 90,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            'Pepper Pizza',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '5kg box of Pizza',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color.fromRGBO(97, 96, 96, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            '\$15',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: Color.fromRGBO(214, 19, 85, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

/// Custom List Item Widget
Widget buildListItem(String imagePath, String title, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: screenWidth * 0.4,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color.fromRGBO(255, 0, 0, 1)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 30,
            width: screenWidth * 0.09,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.04,
                color: Color.fromRGBO(13, 13, 13, 1),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// BurgerCard Widget
class BurgerCard extends StatelessWidget {
  final Map<String, dynamic> burger;

  const BurgerCard({super.key, required this.burger});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                burger["image"],
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                burger["name"],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                burger["quantity"],
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    burger["price"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 19, 85, 1),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BurgerDetailScreen(burger: burger),
                        ),
                      );
                    },
                    backgroundColor: Color.fromRGBO(214, 19, 85, 1),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
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
