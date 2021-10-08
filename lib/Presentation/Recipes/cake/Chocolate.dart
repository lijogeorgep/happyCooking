import 'package:flutter/material.dart';
class Chocolate extends StatefulWidget {
  const Chocolate({Key? key}) : super(key: key);

  @override
  _ChocolateState createState() => _ChocolateState();
}

class _ChocolateState extends State<Chocolate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Chocolate'),),
    );
  }
}
