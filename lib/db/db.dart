
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../model/contact.dart';

class DBHelper {

  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
      "CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,number TEXT, avatar TEXT, email TEXT)",
    );
  }


  Future<ContactModel> insert(ContactModel contactModel) async {
    var dbClient = await db;
    await dbClient!.insert('notes', contactModel.toMap());
    return contactModel;
  }


  Future<List<ContactModel>> getCartListWithUserId() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('notes' );
    return queryResult.map((e) => ContactModel.fromMap(e)).toList();

  }



  Future deleteTableContent(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'notes',
    );
  }


  Future<int> updateQuantity(ContactModel notesModel) async {
    var dbClient = await db;
    return await dbClient!.update(
      'notes',
      notesModel.toMap(),
      where: 'id = ?',
      whereArgs: [notesModel.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }



  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }


}