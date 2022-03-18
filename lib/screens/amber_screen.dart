import 'package:flutter/material.dart';

class AmberScreen extends StatelessWidget {
  const AmberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe4e4e4),
      alignment: Alignment.center,
      child: Text(
        'Amber Screen',
        style: TextStyle(
          color: Colors.amber[700],
          fontSize: 40,
        ),
      ),
    );
  }
}
