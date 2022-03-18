import 'package:flutter/material.dart';
//screens
import 'package:flutter_nav_starter/screens/home_screen.dart';
import 'package:flutter_nav_starter/screens/green_screen.dart';
import 'package:flutter_nav_starter/screens/amber_screen.dart';
//parts of the main page
import 'package:flutter_nav_starter/shared/bottom_nav.dart';
import 'package:flutter_nav_starter/shared/drawer_nav.dart';
import 'package:flutter_nav_starter/shared/top_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //put the things that are the same on every page here...
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  //stateful widget for the main page container for all pages
  // we do this to keep track of current page at the top level
  // the state information can be passed to the BottomNav()
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //state variables go here... this class is instantiated by MainPage
  //changing the state variable currentIndex will change which screen is
  //loaded as the body in Scaffold of MainPageState
  int currentIndex = 0;

  final screens = <Widget>[
    HomeScreen(),
    GreenScreen(),
    AmberScreen(),
  ];

  //we will pass this list to the BottomNav

  // to access variables from MainPage use `widget.`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TopBar(),
      ),
      body: screens[currentIndex],
      // where all the pages get loaded
      drawer: NavDrawer(
          currentIndex: currentIndex,
          onTapped: (i) {
            print(i);
            setState(() => currentIndex = i);
          }),
      bottomNavigationBar: BottomNav(
          currentIndex: currentIndex,
          onTapped: (i) {
            print(i);
            setState(() => currentIndex = i);
          }),
    );
  }
}
