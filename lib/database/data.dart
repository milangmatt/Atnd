import 'package:hive_flutter/hive_flutter.dart';

class AtndDataBase {
  List sublist = [];

  //reference to db
  final _database = Hive.box('atnd_data');

  void createInitialData() {
    sublist = [
      [
        'SA',
        'Subject A',
        29,
        30,
      ],
      [
        'SB',
        'Subject B',
        20,
        25,
      ],
    ];
  }

  void loadData() {
    sublist = _database.get("SUBLIST");
  }

  void updateDataBase() {
    _database.put("SUBLIST", sublist);
  }
}
