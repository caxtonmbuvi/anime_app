// database_helper.dart
import 'package:cubid_crud/data/models/item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('items.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    
    await db.execute('''
    CREATE TABLE IF NOT EXISTS items (
      id $idType,
      name $textType,
      url $textType UNIQUE,
      image $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS item_detail (
      id $idType,
      itemId $textType,
      name $textType,
      image $textType,
      race $textType,
      gender $textType,
      age $textType,
      height $textType,
      weight $textType,
      birthday $textType,
      hair_color $textType,
      eye_color $textType,
      affiliation $textType,
      occupation $textType,
      combat_style $textType,
      partners $textType,
      status $textType,
      relative $textType,
      manga_debut $textType,
      anime_debut $textType,
      japanese_va $textType,
      english_va $textType,
      stage_play $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS item_images (
      id $idType,
      itemId $textType,
      imageUrl $textType
    )
    ''');
  }

  Future<int> insert(String table, var row) async {
    final db = await instance.database;
    return await db.insert(table, row.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> readAll(String tableName) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> result = await db.query(tableName);
    return result;
  }

  Future<List<Map<String, dynamic>>> readSingle(
      String tableName, String id) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> result =
        await db.query(tableName, where: 'itemId = ?', whereArgs: [id]);
    return result;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
