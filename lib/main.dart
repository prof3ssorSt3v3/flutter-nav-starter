import 'package:flutter/material.dart';
//screens
import 'package:flutter_nav_starter/screens/home_screen.dart';
import 'package:flutter_nav_starter/screens/green_screen.dart';
import 'package:flutter_nav_starter/screens/amber_screen.dart';
//parts of the main page
// import 'package:flutter_nav_starter/shared/bottom_nav.dart';
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
    return const MaterialApp(home: MainPage());
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

  final screens = const <Widget>[HomeScreen(), GreenScreen(), AmberScreen()];

  //we will reference this list through the NavDrawer and NavigationBar

  // to access variables here from the MainPage class use the prefix `widget.`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: TopBar()),
      body: screens[currentIndex],
      // where all the pages get loaded
      drawer: NavDrawer(
        currentIndex: currentIndex,
        onTapped: (i) {
          debugPrint('Tapped NavItem $i');
          setState(() => currentIndex = i);
          //same int shared between NavDrawer and NavigationBar
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int i) {
          debugPrint('Tapped NavItem $i');
          setState(() => currentIndex = i);
          //same int shared between NavDrawer and NavigationBar
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.apple), label: 'Green'),
          NavigationDestination(icon: Icon(Icons.android), label: 'Amber'),
        ],
      ),
    );
  }
}
