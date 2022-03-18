import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Admiral AppBar'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.water),
          onPressed: () {
            print('It\'s a Trap!!!');
          },
        )
      ],
    );
  }
}
