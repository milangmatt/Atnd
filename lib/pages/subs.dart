import 'package:Atnd/components/Subtile.dart';
import 'package:Atnd/database/data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
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

  void AttendClass(int index) {
    setState(() {
      db.sublist[index][2]++;
      db.sublist[index][3]++;
    });
    db.updateDataBase();
  }

  void AbsentClass(int index) {
    setState(() {
      db.sublist[index][3]++;
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: db.sublist.length,
      itemBuilder: (context, index) {
        return SubTile(
          SubAbbr: db.sublist[index][0],
          SubName: db.sublist[index][1],
          Attended: db.sublist[index][2],
          Total: db.sublist[index][3],
          AttendClass: () => AttendClass(index),
          AbsentClass: () => AbsentClass(index),
        );
      },
      physics: const BouncingScrollPhysics(),
    ));
  }
}
