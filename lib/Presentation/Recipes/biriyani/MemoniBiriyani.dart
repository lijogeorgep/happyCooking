import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:video_player/video_player.dart';

class MemoniBiriyani extends StatefulWidget {
  const MemoniBiriyani({Key? key}) : super(key: key);

  @override
  _MemoniBiriyaniState createState() => _MemoniBiriyaniState();
}

class _MemoniBiriyaniState extends State<MemoniBiriyani> {
  late FlickManager flickManager;
  final firestoreInstance = FirebaseFirestore.instance;
  List ingredients = [];
  List images = [];
  List weight = [];
  String? ItemName;
  @override
  void initState() {
    _fetch();

    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/happycooking-4b8ca.appspot.com/o/pizza%2FWorld%E2%80%99s%20Best%20Memoni%20Biryani%20Recipe%20_%20Restaurant%20Style%20Biryani%20Recipe%20_%20%E0%A4%AE%E0%A5%87%E0%A4%AE%E0%A4%A8%20%E0%A4%9A%E0%A4%BF%E0%A4%95%E0%A4%A8%20%E0%A4%AC%E0%A4%BF%E0%A4%B0%E0%A4%AF%E0%A4%BE%E0%A4%A8%E0%A5%80.mp4?alt=media&token=43fea475-e320-4e5e-8cdd-f5fe49da0881'),
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
                  ItemName!,
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
            /*  Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount:ingredients.length ,
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
                                ingredients[index],
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  _fetch() {
    firestoreInstance
        .collection('biriyani')
        .doc('Memoni')
        .get()
        .then((ds) {


      setState(() {
        ItemName= ds['item-name'];
       // ingredients = ds['ingredients'];
       // images=ds['imgs'];
      //  weight = ds['weights'];
      });
    });
  }
}
