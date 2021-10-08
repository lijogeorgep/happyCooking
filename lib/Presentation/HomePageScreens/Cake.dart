import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_cooking/Presentation/Recipes/cake/ButterScotch.dart';
import 'package:happy_cooking/Presentation/Recipes/cake/Chocolate.dart';
import 'package:happy_cooking/Presentation/Recipes/cake/DoubleDucker.dart';
import 'package:happy_cooking/Presentation/Recipes/cake/MangoRich.dart';
import 'package:happy_cooking/Presentation/Recipes/cake/TripleQueen.dart';

class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  _CakeState createState() => _CakeState();
}

class _CakeState extends State<Cake> {
  final firestoreInstance = FirebaseFirestore.instance;
  List icons = [];
  List images = [];
  List cakeItems = [];

  List pages = [
    Chocolate(),
    ButterScotch(),
    TripleQueen(),
    DoubleDucker(),
    MangoRich(),
  ];
  String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/happycooking-4b8ca.appspot.com/o/cake%2Fchocolate-cake-with-chocolate-sprinkles_144627-8998-removebg-preview.png?alt=media&token=ff84c6cc-cb73-482f-bfeb-44139ed5709c";
  String cakeName = "Chocolate";
  var recpiePages;
  @override
  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffF1CCBE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    'HANDBAKE\n\t\t\t\t\t\t\t\t\t\t WITH \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tLOVE',
                    style: TextStyle(
                        fontFamily: 'LuckiestGuy',
                        fontSize: 30,
                        letterSpacing: 3.0),
                  )),
              Container(
                height: MediaQuery.of(context).size.height / 2 * 1.5,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2 * 1.15,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.pink,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/save-f-web.png',
                            scale: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cakeName,
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'Lobster'),
                            ),
                          ),
                          Container(
                              // color: Colors.orange,
                              child: Image.network(
                            imageUrl,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){
                                    print(recpiePages);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>recpiePages));
                                  },
                                  child: Text('Recpie for baking',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'LuckiestGuy',
                                          decoration:
                                          TextDecoration.underline)),
                                ),
                              ),
                            ),
                            // color: Colors.red,
                        /*    child: ListView.builder(
                                itemCount: icons.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => pages[index]));
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text('Recpie for baking',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'LuckiestGuy',
                                                decoration:
                                                    TextDecoration.underline)),
                                      ),
                                    ),
                                  );
                                }),*/
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                      //  color: Colors.greenAccent,
                      color: Color(0xffF1CCBE),
                      child: ListView.separated(
                        itemCount: icons.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                imageUrl = images[index];
                                cakeName = cakeItems[index];
                                recpiePages=pages[index];

                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              //   color: Colors.white,
                              child: Image.network(icons[index]),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() {
    /// icons
    firestoreInstance.collection('cake').doc('icons').get().then((ds) {
      setState(() {
        icons = ds['ico'];
        /*print("_______banner_________");
        print(img);*/
      });
    });

    /// images
    firestoreInstance.collection('cake').doc('images').get().then((ds) {
      setState(() {
        images = ds['imgs'];
        /*print("_______banner_________");
        print(img);*/
      });
    });

    /// cake items names
    firestoreInstance.collection('cake').doc('cake-names').get().then((ds) {
      setState(() {
        cakeItems = ds['cakeitems'];
        /*print("_______banner_________");
        print(img);*/
      });
    });
  }
}
