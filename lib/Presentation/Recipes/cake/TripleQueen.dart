import 'package:flutter/material.dart';
class TripleQueen extends StatefulWidget {
  const TripleQueen({Key? key}) : super(key: key);

  @override
  _TripleQueenState createState() => _TripleQueenState();
}

class _TripleQueenState extends State<TripleQueen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('triple queen'),),
    );
  }
}
