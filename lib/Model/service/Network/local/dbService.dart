import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:weatherapp/Model/models/weatherModule.dart';

class DbHealper {
  static Database? _database;

  static const table = "searchHistory.db";
  static String path = "";

  Future<Database> sqflite() async {
    if (_database != null) return _database!;

    path = join(await getDatabasesPath(), table);
    _database = await openDatabase(path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
        create table weather (main  TEXT,status TEXT,countryCode TEXT,assetImage TEXT)''');
        },
        //onOpen: (database) => getSearchHistory());
    );
    return _database!;
  }

  Future<List<Map>> getSearchHistory() async {
    //database.rawQuery('select* from $table');
    List<Map> res = await _database!.query(
            "searchHistory") /* .catchError((onError) {
      print("OH NO query not working {$onError.toString()}"); 
    
      }) */
        ;
    //get task map
    /*   List<Taskmodel> taskList = [];
    L.forEach((element) {
      taskList.add(Taskmodel.toObj(element));
     */
    print(res);
    return res;
  }

  void insertTask(WeatherModule module) async {
    //filter stored data
    /*   module.toJson().removeWhere((key, value) => key=='coord'||key=='timezone'||key=='cod'||key=='wind'
     ||key=='base'||key=='visibility'||key=='id'||key=='dt'||); */
    Map<String, dynamic> jsonData = {
      'name': module.getName,
      'main': module.getMain!.toJson(),
      'countryCode':module.getSys!.country,

    };
    return _database!
        .transaction((txn) => txn.insert("Tasksbase", jsonData).then((value) {
              print("db Inserted\n");
              return null;
            }).catchError((onError) {
              print("OH NO {$onError.toString()}");
            }));

    //id of last inserted row
  }

  //returns number of rows affected
  /*  Future<int> deleteTask(WeatherModule module) async {
     Database d = await sqflite();
    int numOfChangesMade =
        await d.delete(table, where: "id= ?", whereArgs: [module.id]);
    return numOfChangesMade;
  } */

/*   Future<int> updateTask(WeatherModule module) async {
    final Database d = await sqflite();
    int numOfChangesMade = await d
        .update(table, module.toMap(module), where: "id= ?", whereArgs: [module.id]);
    return numOfChangesMade;
  } */
}
