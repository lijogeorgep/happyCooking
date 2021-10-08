import 'package:flutter/material.dart';
class DoubleDucker extends StatefulWidget {
  const DoubleDucker({Key? key}) : super(key: key);

  @override
  _DoubleDuckerState createState() => _DoubleDuckerState();
}

class _DoubleDuckerState extends State<DoubleDucker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('double ducker'),),
    );
  }
}
