import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soccervio/pages/profile/profile_page.dart';

import 'package:soccervio/pages/search/search.dart';

import 'home/home.dart';

class BtnNavBar extends StatefulWidget {
  const BtnNavBar({Key? key}) : super(key: key);

  @override
  State<BtnNavBar> createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  int _selectedIndex = 1;
  final List<Widget> _children = [
    HomeScreen(),
    Search(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger), label: "Reservations"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage("assets/images/user.png")),
              label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
