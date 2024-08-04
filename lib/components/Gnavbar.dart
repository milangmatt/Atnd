// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.grey[900],
      child: GNav(
        color: Colors.grey[500],
        mainAxisAlignment: MainAxisAlignment.center,
        tabMargin: const EdgeInsets.symmetric(horizontal: 25),
        activeColor: Colors.white70,
        onTabChange: (value) => onTabChange!(value),
        haptic: true,
        rippleColor: Colors.black54,
        tabs: const [
          GButton(
            icon: Icons.amp_stories_rounded,
            text: '',
          ),
          GButton(
            icon: Icons.app_registration_rounded,
            text: '',
          ),
        ],
        iconSize: 30,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabBackgroundColor: const Color.fromARGB(255, 10, 10, 10),
        tabActiveBorder: Border.all(
          color: const Color.fromARGB(255, 31, 30, 30),
        ),
        selectedIndex: 0,
        tabBorderRadius: 16,
      ),
    );
  }
}
