
import 'package:flutter/material.dart';

import '../widgets/guide_screen.dart';
import '../widgets/home.dart';
import '../widgets/image_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Home(),
    ImageScreen(),
    //SoundScreen(),
    Guide(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('PneumoScan',style: TextStyle(fontSize: 30),),
        //   centerTitle: true,
        //   automaticallyImplyLeading: true,
        //   backgroundColor: const Color(0xFFf5641d),
        //   elevation: 0,
        // ),
        body: _pages.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          iconSize: 24,
          selectedFontSize: 13,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.grey.shade900,
          selectedIconTheme:
              IconThemeData(color: Colors.greenAccent.shade100, size: 30),
          selectedItemColor: Colors.greenAccent.shade100,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.deepOrange.shade900,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.image),
              label: 'Image',
              backgroundColor: Colors.grey.shade900.withOpacity(0.9),
            ),
            //  BottomNavigationBarItem(
            //   icon: const Icon(Icons.mic),
            //   label: 'Recorder',
            //   backgroundColor: Colors.grey.shade900.withOpacity(0.9),
            // ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: 'Guide',
              backgroundColor: Colors.grey.shade900.withOpacity(0.9),
            ),
          ],
        ),
      ),
    );
  }
}
