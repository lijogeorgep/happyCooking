import 'package:flutter/material.dart';
class ButterScotch extends StatefulWidget {
  const ButterScotch({Key? key}) : super(key: key);

  @override
  _ButterScotchState createState() => _ButterScotchState();
}

class _ButterScotchState extends State<ButterScotch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('butter scotch'),),
    );
  }
}
