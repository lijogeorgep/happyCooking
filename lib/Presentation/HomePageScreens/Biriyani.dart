import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:happy_cooking/Presentation/Recipes/DindigulBiriyani.dart';
import 'package:happy_cooking/Presentation/Recipes/MemoniBiriyani.dart';
import 'package:happy_cooking/Presentation/Recipes/MugulaiBiriyani.dart';
class Biriyani extends StatefulWidget {
  const Biriyani({Key? key}) : super(key: key);

  @override
  _BiriyaniState createState() => _BiriyaniState();
}

class _BiriyaniState extends State<Biriyani> {
  final firestoreInstance = FirebaseFirestore.instance;
var img;
List popularImages=[];
List items=[];
List biriyani_types=[
  DindigualBiriyani(),
  MemoniBiriyani(),
  MugulaiBiriyani(),
];
  @override
  void initState() {
    _fetch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 20.0, height: 100.0),
                const Text(
                  'Biriyani',
                  style: TextStyle(fontSize: 43.0,color:Color(0xff3D3C3A),fontFamily: 'Lobster'),
                ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'CarterOne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('SPICY',
                          textStyle: TextStyle(color: Color(0xffFF7F7F))),
                      RotateAnimatedText('TASTY',
                          textStyle: TextStyle(color: Color(0xffFFD580))),
                      RotateAnimatedText('HEALTHY',
                          textStyle: TextStyle(color: Color(0xffADD8E6))),
                    ],

                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
banner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text('Categories',style: TextStyle(fontFamily: 'CarterOne',fontSize: 20),)),
          ),
          Catgories(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Popular now',style: TextStyle(fontFamily: 'CarterOne',fontSize: 20),)),
          ),
          PopularNow(),
        ],
      )),
    ));
  }
Widget banner() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Image.network(img,fit: BoxFit.contain,scale: 1,),
      ),
    );
}
  _fetch() {
    /// banner
    firestoreInstance
        .collection('biriyani')
        .doc('banner')
        .get()
        .then((ds) {


      setState(() {

        img = ds['image'];
        print("_______banner_________");
        print(img);

      });
    });
    /// types of biriyani
    firestoreInstance
        .collection('biriyani')
        .doc('popular-now')
        .get()
        .then((ds) {


      setState(() {

        popularImages = ds['imgs'];
        items= ds['items'];
        print("___________popular_______");
        print( popularImages);

      });
    });

  }

  Widget Catgories() {
    return Container(
      height:100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 8.0),
      //color:Colors.red,
      child:Wrap(
        spacing: 4.0,
        direction: Axis.horizontal,
        children: [
          Chip(avatar: CircleAvatar(backgroundImage:AssetImage('assets/images/dum.png'),backgroundColor: Colors.white,),
            label: const Text('Dum Biriyani'),
            backgroundColor:Color(0xFFB3F1C2),
            padding: EdgeInsets.all(2.0),
          ),
          Chip(avatar: CircleAvatar(backgroundImage:AssetImage('assets/images/dum.png'),backgroundColor: Colors.white,),
            label: const Text('Veg Biriyani'),
            backgroundColor:Color(0xFFB3F1C2),
            padding: EdgeInsets.all(2.0),
          ),
          Chip(avatar: CircleAvatar(backgroundImage:AssetImage('assets/images/dum.png'),backgroundColor: Colors.white,),
            label: const Text('Egg Biriyani'),
            backgroundColor:Color(0xFFB3F1C2),
            padding: EdgeInsets.all(2.0),
          ),
          Chip(avatar: CircleAvatar(backgroundImage:AssetImage('assets/images/dum.png'),backgroundColor: Colors.white,),
            label: const Text('Thalassery Biriyani'),
            backgroundColor:Color(0xFFB3F1C2),
            padding: EdgeInsets.all(2.0),
          ),
          Chip(avatar: CircleAvatar(backgroundImage:AssetImage('assets/images/dum.png'),backgroundColor: Colors.white,),
            label: const Text('Hyderabadi Biriyani'),
            backgroundColor:Color(0xFFB3F1C2),
            padding: EdgeInsets.all(2.0),
          ),
        ],
      ),
    );
  }

  Widget PopularNow() {

    return Container(
      height: 280,
    //  color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          itemCount: items.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => biriyani_types[index]));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                decoration: BoxDecoration(
                  border:Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                //  color: Color(0xFF89C35C),
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                            width: 200,
                            child: Image.network(popularImages[index],fit: BoxFit.cover,),),
                      ),
                      Positioned(
                        top:230,
                          left: 50,
                          child: Text(items[index],style: TextStyle(fontFamily: 'Righteous'),),),
                      Positioned(
                        top: 80,
                        left: 80,
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
                ),
              ),
            );
    },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },

      ),
    );
  }

}
