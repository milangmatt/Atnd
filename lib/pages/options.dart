import 'package:Atnd/components/AddSubDialog.dart';
import 'package:Atnd/components/EditSubDialog.dart';
import 'package:Atnd/components/Optile.dart';
import 'package:Atnd/database/data.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
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

  void AddSubject() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddSubDialog(
            onConfirm: (newsub) {
              setState(() {
                db.sublist.add(newsub);
              });
              db.updateDataBase();
            },
          );
        });
  }

  void EditSubject(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditSubDialog(
            onConfirm: (editsub) {
              setState(() {
                db.sublist[index][2] =
                    editsub[0]; // Update values within setState
                db.sublist[index][3] = editsub[1];
              });
              db.updateDataBase();
            },
          );
        },
      );
    });
  }

  void DeleteSubject(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Subject',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Are you sure to delete the Subject',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 25,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Theme.of(context).colorScheme.onSurface,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          db.sublist.removeAt(index);
                        });
                        db.updateDataBase();
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Theme.of(context).colorScheme.error,
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: db.sublist.length,
        itemBuilder: (context, index) {
          return Optile(
            SubAbbr: db.sublist[index][0],
            SubName: db.sublist[index][1],
            Attended: db.sublist[index][2],
            Total: db.sublist[index][3],
            DeleteSubject: (context) => DeleteSubject(index),
            EditSubject: (context) => EditSubject(index),
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: AddSubject,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
