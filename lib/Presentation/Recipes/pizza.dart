import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';


import 'package:video_player/video_player.dart';

class Pizza extends StatefulWidget {
  const Pizza({Key? key}) : super(key: key);

  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  late FlickManager flickManager;
  final firestoreInstance = FirebaseFirestore.instance;

  List itemName = [];
  List images = [];
  List weight = [];

  @override
  void initState() {
    _fetch();



    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/happycooking-4b8ca.appspot.com/o/pizza%2FitalianPizza.mp4?alt=media&token=e4926605-c3d0-4e82-bad3-884c3a5eebe0'),

    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'ITALIAN PIZZA',
                  style: TextStyle(fontFamily: 'LuckiestGuy', fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4 * 1.25,
                // color: Colors.greenAccent,
                child: Center(
                  child: FlickVideoPlayer(flickManager: flickManager),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Ingridients',
                    style: TextStyle(fontFamily: 'Righteous', fontSize: 25),
                  ),
                ),
              ),
              Container(
          height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount:itemName.length ,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              elevation: 1,
              child: ListTile(
                    leading: Container(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(images[index])),
                title: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      itemName[index],
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'Righteous'),
                    )),
                trailing: Text(weight[index]),
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
    ),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() {
    firestoreInstance
        .collection('instant-recpie')
        .doc('pizza')
        .get()
        .then((ds) {
      /*ds.docs.forEach((element) {
        setState(() {
          itemName = element.data()["item"];
         // images = element.data()["imgs"];
          weight = element.data()["weight"];
          // videoFile = element.data()["video"];
        });
      });*/

      setState(() {

        itemName = ds['item'];
        images=ds['imgs'];
        weight = ds['weight'];
      });
    });
  }
}
