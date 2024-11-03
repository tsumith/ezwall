import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? db;
  DbHelper._(); //creating a private constructor for single object use
  static final DbHelper getInstance =
      DbHelper._(); //method for accessing the single object
  //checking if the db is already opened or not

  Future<Database> getDb() async {
    if (db != null) {
      return db!;
    } else {
      db = await createDb();
      return db!;
    }
  }

  static String clmSNo = "SNo";
  static String table_name = "wallet";
  static String clmAmount = "amount";
  static String clm_transaction = "trans";
  static String clmDescription = "desc";

  Future<Database> createDb() async {
    Directory appDir =
        await getApplicationDocumentsDirectory(); //getting the path of the application doc dir
    String dbPath = join(appDir.path,
        "zzzwall.db"); //finding the path to store in local mobile storage
    return await openDatabase(dbPath, version: 1,
        onCreate: (database, version) {
      database.execute(
          "create table $table_name ($clmSNo integer primary key autoincrement,$clmAmount integer,$clmDescription text,$clm_transaction text)");
    });
  }

  //adding data to db
  Future<bool> addData(
      {required int amount,
      required String description,
      required String transacn}) async {
    final mydb = await getDb(); //getting the current database
    int rowsEffected = await mydb.insert(table_name, {
      clmAmount: amount,
      clmDescription: description,
      clm_transaction: transacn
    });
    return rowsEffected > 0; //checking if data is inserted or not
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final mydb = await getDb();
    return mydb.query(table_name);
  }

  Future<int> gettotalAmount() async {
    final mydb = await getDb();
    List<Map> result = await mydb
        .rawQuery('select sum($clmAmount) as total_amount from $table_name');
    return result.first['total_amount'];
  }
}
