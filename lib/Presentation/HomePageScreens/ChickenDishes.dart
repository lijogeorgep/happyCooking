import 'package:flutter/material.dart';
class ChikenDishes extends StatefulWidget {
  const ChikenDishes({Key? key}) : super(key: key);

  @override
  _ChikenDishesState createState() => _ChikenDishesState();
}

class _ChikenDishesState extends State<ChikenDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('chicken dishes'),
      ),
    );
  }
}
