import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import './Expense.dart';

/* Singleton class for DataBase reader */
class DBProvider {
  DBProvider._(); // private constructor
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpensesDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Expenses ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "category INTEGER,"
          "dateDay INTEGER,"
          "dateMonth INTEGER,"
          "dateYear INTEGER,"
          "amount REAL"
          ")");
    });
  }

  createTestData() async {
    final db = await database;
    await db.insert(
        "Expenses",
        Expense(
          id: 1,
          title: 'Test1',
          dateDay: 1,
          dateMonth: 3,
          dateYear: 2020,
          category: "none",
          amount: 14.5,
        ).toMap());
    await db.insert(
        "Expenses",
        Expense(
          id: 2,
          title: 'Test2',
          dateDay: 1,
          dateMonth: 3,
          dateYear: 2020,
          category: "none",
          amount: 14.5,
        ).toMap());
    await db.insert(
        "Expenses",
        Expense(
          id: 3,
          title: 'Test3',
          dateDay: 1,
          dateMonth: 3,
          dateYear: 2020,
          category: "none",
          amount: 14.5,
        ).toMap());
  }

  addNewExpense(Expense newExpense) async {
    final db = await database;
    var res = await db.insert("Expenses", newExpense.toMap());
    return res;
  }

  getExpense(int id) async {
    final db = await database;
    var res = await db.query("Expenses", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? Expense.fromMap(res.first) : Null;
  }

  /* Geting List<Expense> of Expenses */
  getExpenses() async {
    // createTestData();
    final db = await database;
    var res = await db.query("Expenses");
    return res.isNotEmpty ? res.map((c) => Expense.fromMap(c)).toList() : [];
  }

  updateExpense(Expense newExpense) async {
    final db = await database;
    var res = await db.update("Expenses", newExpense.toMap(),
        where: "id=?", whereArgs: [newExpense.id]);
    return res;
  }

  deleteExpense(int id) async {
    final db = await database;
    db.delete("Expenses", where: "id=?", whereArgs: [id]);
  }
}
