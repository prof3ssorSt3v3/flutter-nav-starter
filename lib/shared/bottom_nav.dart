import 'package:flutter/material.dart';

//OLD VERSION using the BottomNavigationBar Widget

class BottomNav extends StatefulWidget {
  //constructor can accept values passed in from the MainPage
  // Arguments here would be things like `this.name`
  // Then we need to declare a variable `name`.
  // We can insist on the argument being passed in with `required`
  BottomNav({Key? key, this.currentIndex = 0, required this.onTapped}) : super(key: key);
  // currentIndex is not final because we need to change it
  int currentIndex;
  final Function(int) onTapped;

  final labels = <String>['Home', 'Green', 'Amber'];
  final icons = <IconData>[Icons.home, Icons.verified_user, Icons.wallet_giftcard];

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting, //text only for current or fixed
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue, //text and icon
      unselectedItemColor: Colors.grey, //text and icon
      iconSize: 40,
      currentIndex: widget.currentIndex, //needs stateful widget to update this value
      items: [
        for (var i = 0; i < widget.labels.length; i++)
          BottomNavigationBarItem(icon: Icon(widget.icons[i]), label: widget.labels[i]),
      ],
      onTap: (int index) {
        //what to do when they click
        //onTap function will be passed the index of the tapped BarItem
        //widget.currentIndex will be updated via the change in main.dart
        //which will be triggered by widget.onTapped
        // setState(() => widget.currentIndex = index);
        widget.onTapped(index);
      },
    );
  }
}

BottomNavigationBarItem buildNavItems(String label, IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
