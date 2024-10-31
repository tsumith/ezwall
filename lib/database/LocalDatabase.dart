import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Localdb {
  Localdb._(); //creating a private constructor for single object use
  static final Localdb getInstance =
      Localdb._(); //method for accessing the single object
  //checking if the db is already opened or not
  Database? db;
  Future<Database> getDb() async {
    if (db == null) {
      return db!;
    } else {
      db = await openDb();
      return db!;
    }
  }

  static final String clmSNo = "SNo";
  static final String tableName = "wallet";
  static final String clmAmount = "amount";
  static final String clmTransaction = "Transaction";
  static final String clmDescription = "description";

  Future<Database> openDb() async {
    Directory appDir =
        await getApplicationDocumentsDirectory(); //getting the path of the application doc dir
    String dbPath = join(appDir.path,
        "wallet.db"); //finding the path to store in local mobile storage
    return await openDatabase(dbPath, onCreate: (database, version) {
      database.execute(
          "create table $tableName ($clmSNo INTEGER PRIMARY KEY AUTOINCREMENT,$clmAmount INT,$clmDescription TEXT,$clmTransaction Text)");
    }, version: 1);
  }

  //adding data to db
  Future<bool> addData(
      {required int amount,
      String? description,
      required String transaction}) async {
    var currentDb = await getDb(); //getting the current database
    int rowsEffected = await currentDb.insert(tableName, {
      clmAmount: amount,
      clmDescription: description,
      clmTransaction: transaction
    });
    return rowsEffected > 0; //checking if data is inserted or not
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database currentdb = await getDb();
    return currentdb.query(tableName); //accessing the data from database
  }
}
