import 'package:flutter/material.dart';
class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  _CakeState createState() => _CakeState();
}

class _CakeState extends State<Cake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cake'),),
    );
  }
}
