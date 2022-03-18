import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key? key, required this.currentIndex, required this.onTapped})
      : super(key: key);

  int currentIndex;
  final Function(int) onTapped;

  final labels = <String>[
    'Home',
    'Green',
    'Amber',
  ];
  final icons = <IconData>[
    Icons.home,
    Icons.verified_user,
    Icons.wallet_giftcard,
  ];

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Choose a Link',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (var i = 0; i < widget.labels.length; i++)
          ListTile(
            leading: Icon(widget.icons[i]),
            title: Text(widget.labels[i]),
            onTap: () {
              print('tapped $i');
              widget.onTapped(i);
              //drawer needs to be removed from history
              Navigator.of(context).pop();
            },
          ),
      ],
    ));
  }
}
