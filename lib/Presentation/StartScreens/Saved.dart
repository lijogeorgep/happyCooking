import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:video_player/video_player.dart';
class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  late FlickManager flickManager;
  final firestoreInstance = FirebaseFirestore.instance;
List  biriyaniName=[];
  List savedVideos = [];
  @override
  void initState() {
    _fetch();


    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: savedVideos.length,
        itemBuilder: (BuildContext context, int index) {

          flickManager = FlickManager(
            videoPlayerController: VideoPlayerController.network(savedVideos[index]),
          );
          return  Container(
            padding: EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4 * 1.25,
            // color: Colors.greenAccent,
            child: Column(
              children: [
                Text(biriyaniName[index]),
                Center(
                  child: FlickVideoPlayer(flickManager: flickManager),
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
    );
  }

  void _fetch() {
    firestoreInstance.collection('saved').doc('videos').get().then((ds) {
      setState(() {
        savedVideos = ds['videos'];
        biriyaniName= ds['productNames'];
      });
    });
  }
}
