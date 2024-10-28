import 'package:sqflite/sqflite.dart';

Database? _database;

class Localdatabase {
  Future<void> _initDatabase() async {
    _database = await openDatabase("wallet_database.db",
        version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE wallet (id INTEGER PRIMARY KEY AUTOINCREMENT,transaction TEXT,amount INTEGERso )''');
  }
}
