import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe4e4e4),
      alignment: Alignment.center,
      child: Text(
        'Home Screen',
        style: TextStyle(
          color: Colors.lightBlue[700],
          fontSize: 40,
        ),
      ),
    );
  }
}
