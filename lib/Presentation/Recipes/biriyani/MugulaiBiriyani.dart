import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:video_player/video_player.dart';

class MugulaiBiriyani extends StatefulWidget {
  const MugulaiBiriyani({Key? key}) : super(key: key);

  @override
  _MugulaiBiriyaniState createState() => _MugulaiBiriyaniState();
}

class _MugulaiBiriyaniState extends State<MugulaiBiriyani> {
  late FlickManager flickManager;
  final firestoreInstance = FirebaseFirestore.instance;
  List ingredients = [];
  List images = [];
  List weight = [];

  @override
  void initState() {
    _fetch();

    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/happycooking-4b8ca.appspot.com/o/pizza%2Fdindigul.JPG.jpg?alt=media&token=f39f0815-81f8-4bab-9383-53ee343e3eec'),
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
                  'Mugulai Biriyani',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() {
    firestoreInstance
        .collection('biriyani')
        .doc('Dindigul')
        .get()
        .then((ds) {


      setState(() {

        ingredients = ds['ingredients'];
        images=ds['imgs'];
        weight = ds['weights'];
      });
    });
  }
}
