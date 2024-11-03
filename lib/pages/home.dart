// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/Nav/Activity.dart';
import 'package:zzzwall/pages/Nav/Profile.dart';
import 'package:zzzwall/pages/Nav/Recent.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/HomeDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper? mydb;
  int _currentIndex = 0;
  List<Widget> pages = [
    RootPage(),
    RecentPage(),
    ActivityPage(),
    ProfilePage()
  ];
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushNamed(context, '/SignInPage');
    });
  }

  @override
  void initState() {
    super.initState();
    mydb = DbHelper.getInstance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        duration: Duration(milliseconds: 370),
        gap: 8,
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        rippleColor: Color.fromARGB(255, 4, 42, 73),
        activeColor: Colors.blue,
        tabBackgroundColor: Color.fromARGB(255, 43, 53, 56),
        tabBorderRadius: 40,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        haptic: true,
        selectedIndex: _currentIndex,
        onTabChange: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        tabs: [
          GButton(
            icon: Iconsax.home,
            text: "home",
          ),
          GButton(
            icon: Iconsax.clock,
            text: "recent",
          ),
          GButton(
            icon: Iconsax.activity,
            text: "activity",
          ),
          GButton(
            icon: Iconsax.user,
            text: "profile",
          ),
        ],
        color: Colors.white,
      ),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WhiteText(data: "zzzwall"),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: _signOut,
              style:
                  ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
      body: pages[_currentIndex],
      //drawer
      drawer: Homedrawer(),
    );
  }
}

// ignore: must_be_immutable
