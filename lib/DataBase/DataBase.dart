import 'package:sqflite/sqflite.dart' as sql;
class SQLdb {
  // database creation
   static Future<sql.Database> createDatabase()async{
    return sql.openDatabase("mydairy", version: 1 , onCreate: (sql.Database database, int version)async {
      await createTable(database);
    },);
   }
   
     static Future <void> createTable(sql.Database database) async{
      await database.execute("""CREATE TABLE dairy(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        dtitle TEXT,
        dcontent TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
     }
// save title and content
  static Future <int> create_dairy(String title, String content) async{
    final db = await SQLdb.createDatabase();
    final data = {'dtitle':title, 'dcontent' : content};
    final id = await db.insert('dairy', data);
    return id;
  }
// to read content
  static Future <List<Map<String, dynamic>>> load_dairy() async{
    final db = await SQLdb.createDatabase(); 
    return db.query('dairy', orderBy: 'id');
  }

  static update_dairy(int id, String title, String content) async{
    final db = await SQLdb.createDatabase();
    final newdata = {'dtitle':title, 'dcontent' : content, 'createdAt' : DateTime.now().toString()};
    final upid = await db.update('dairy', newdata, where:  'id = ?', whereArgs: [id]);
   
  }

  static Future < void> delete_dairy(int id) async{
    final db = await SQLdb.createDatabase();
    await db.execute('DELETE FROM dairy WHERE id =?', [id]);
  }

 
}