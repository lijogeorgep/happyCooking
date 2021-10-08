import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final firestoreInstance = FirebaseFirestore.instance;
  List savedVideos = [];
  @override
  void initState() {
    _fetch();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: savedVideos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(savedVideos[index]),
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
      });
    });
  }
}
