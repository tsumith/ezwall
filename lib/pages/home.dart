// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/Button1.dart';
import 'package:zzzwall/pages/components/HomeDrawer.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushNamed(context, '/SignInPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    List<String> Pages = [
      "HomePage",
      "RecentPage",
      "ActivityPage",
      "ProfilePage"
    ];

    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        rippleColor: const Color.fromARGB(255, 4, 42, 73),
        activeColor: Colors.blue,
        tabBackgroundColor: Color.fromARGB(255, 43, 53, 56),
        tabBorderRadius: 40,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        haptic: true,
        onTabChange: (value) {
          if (value == 0) {
            count++;
          } else {
            Navigator.pushNamed(context, Pages[value]);
          }
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
      backgroundColor: Colors.black,
      body: RootPage(),
      //drawer
      drawer: Homedrawer(),
    );
  }
}

// ignore: must_be_immutable
