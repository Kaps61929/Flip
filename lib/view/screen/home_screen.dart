import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/view/widgets/custom_icon.dart';
import '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int pageIdx = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            setState(() {
              pageIdx = idx;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIdx,
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, size: 30),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search, size: 30),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CustomIcon(),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: Icon(Icons.message, size: 30),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person, size: 30),
            )
          ]),
      body: pages[pageIdx],
    );
  }
}
