// ignore_for_file: prefer_const_constructors

import 'package:Atnd/components/Gnavbar.dart';
import 'package:Atnd/database/data.dart';
import 'package:Atnd/pages/options.dart';
import 'package:Atnd/pages/subs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _database = Hive.box('atnd_data');
  AtndDataBase db = AtndDataBase();
  @override
  void initState() {
    if (_database.get("SUBLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  int currentIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> pages = [
    const Subjects(),
    const Options(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Atnd',
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[currentIndex],
    );
  }
}
