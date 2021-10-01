import 'package:flutter/material.dart';


class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -20,
                child: Image.asset(
                  'assets/images/flashScreen.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 450,
                left: 50,
                child: Text(
                  '10K+ PREMIUM RECIPES ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC12283),
                  ),
                ),
              ),
              Positioned(
                  top: 500,
                  left: 50,
                  child: Text(
                    'Happy',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Righteous',
                        letterSpacing: 2.0),
                  )),
              Positioned(
                  top: 600,
                  left: 50,
                  child: Text(
                    'Cooking',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Righteous',
                        letterSpacing: 4.0),
                  )),
              Positioned(
                  top: 700,
                  left: 50,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, '/bottomNavigation'),
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFDAA520),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                          child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Lobster',
                            letterSpacing: 4.0,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
