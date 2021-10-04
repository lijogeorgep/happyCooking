import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  _CakeState createState() => _CakeState();
}


class _CakeState extends State<Cake> {
  final firestoreInstance = FirebaseFirestore.instance;
  var img;
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
              banner(),
            ],
          ),
        ),
      ),
    );
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
        .collection('cake')
        .doc('banner')
        .get()
        .then((ds) {


      setState(() {

        img = ds['img'];
        print("_______banner_________");
        print(img);

      });
    });


  }
}
