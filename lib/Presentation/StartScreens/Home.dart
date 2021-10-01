import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_cooking/Presentation/HomePageScreens/All.dart';
import 'package:happy_cooking/Presentation/HomePageScreens/Biriyani.dart';
import 'package:happy_cooking/Presentation/HomePageScreens/Cake.dart';
import 'package:happy_cooking/Presentation/HomePageScreens/ChickenDishes.dart';
import 'package:happy_cooking/Presentation/Recipes/hamburger.dart';
import 'package:happy_cooking/Presentation/Recipes/nuggets.dart';
import 'package:happy_cooking/Presentation/Recipes/pizza.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = ["All", "Cake", "Biriyani", "Chiken Dishes"];
  List pages = [All(), Cake(), Biriyani(), ChikenDishes()];
  List videoPages = [Pizza(),Nuggets(),Hamburger()];
List thumbnails=[
  Image.asset(
    'assets/images/pizza.jpg',
    height: 380,
    fit: BoxFit.cover,
  ),
  Image.asset(
    'assets/images/nuggets.jpg',
    height: 380,
    fit: BoxFit.cover,
  ),
  Image.asset(
    'assets/images/hamburger.jpg',
    height: 380,
    fit: BoxFit.cover,
  ),
];
List thumbnail_heading=[
  "Italian Pizza",
  "Chicken Nugget",
  "Hamburger"
];
List thumbnail_detials=[
  "Most delicious italian pizza recipe",
  'Spicy and tasty chicken nugget recipe',
  'Ultimate Juicy Burger recipe'
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Find Best Recipe',
                  style: TextStyle(
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'CarterOne'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'For Cooking',
                  style: TextStyle(
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'CarterOne'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            /// search and filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width / 2 * 1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Search recipe',
                      hintStyle: TextStyle(fontSize: 11.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9FAED),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'assets/icons/filter-horizontal.png',
                    scale: 8,
                    color: Color(0xFF4EC66B),
                  ),
                ),
              ],
            ),

            /// button links
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),

              height: 50,
              width: MediaQuery.of(context).size.width,
              // color:Colors.red,
              child: ListView.separated(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          data[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pages[index]));
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),

            /// recipe videos
            Container(
              // color: Colors.red,
              height: 380,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                itemCount: videoPages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => videoPages[index]));
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 380,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: thumbnails[index],
                          ),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Positioned(
                          top: 300,
                          left: 40,
                          child: Text( thumbnail_heading[index],
                            style: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: 3.0),
                          ),
                        ),
                        Positioned(
                          top: 340,
                          left: 40,
                          child: Text(
                            thumbnail_detials[index],
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          right: 25,
                          child: Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              'assets/icons/play-button.png',
                              color: Color(0xFFF2F3F4),
                              scale: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            /// social media links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: Image.asset(
                  'assets/icons/instagram.png',
                  scale: 10,
                )),
                GestureDetector(
                    child: Image.asset(
                  'assets/icons/facebook.png',
                  scale: 10,
                )),
                GestureDetector(
                    child: Image.asset(
                  'assets/icons/pinterest.png',
                  scale: 10,
                )),
                GestureDetector(
                    child: Image.asset(
                  'assets/icons/telegram.png',
                  scale: 10,
                )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
