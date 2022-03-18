import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe4e4e4),
      alignment: Alignment.center,
      child: Text(
        'Green Screen',
        style: TextStyle(
          color: Colors.lightGreen[700],
          fontSize: 40,
        ),
      ),
    );
  }
}
