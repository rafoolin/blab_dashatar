import 'package:sqflite/sqflite.dart';

import '../data.dart';

class CharacteristicDoa {
  // Singleton
  static final CharacteristicDoa _doa = CharacteristicDoa._internal();
  CharacteristicDoa._internal();
  factory CharacteristicDoa() => _doa;

  final DatabaseProvider _provider = DatabaseProvider();

  /// Characteristic table name
  static final String tableName = 'Characteristic_Table';

  /// Query to create [tableName] into the database.
  static String get tableCreationQuery {
    return '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT PRIMARY KEY,
      role INTEGER NOT NULL,
      strength INTEGER NOT NULL,
      agility INTEGER NOT NULL,
      wisdom INTEGER NOT NULL,
      charisma INTEGER NOT NULL
    );
    ''';
  }

  /// Insert a new [characteristic] in the database.
  Future<int> insert(Characteristic characteristic) async {
    Database db = await _provider.db;

    return await db.insert(
      tableName,
      characteristic.toDBMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  /// Delete an existing [id] from the database.
  Future<int> delete(String id) async {
    Database db = await _provider.db;

    return await db.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  /// Return true if [id] exists in the database.
  Future<bool> isFavored(String id) async {
    Database db = await _provider.db;

    var rawResult = await db.query(
      tableName,
      where: 'id=?',
      whereArgs: [id],
    );
    return rawResult.isNotEmpty;
  }

  /// Return a list of all raw Characteristics in the database.
  Future<List<Map<String, dynamic>>> getFavorites() async {
    Database db = await _provider.db;

    var rawResult = await db.query(tableName, orderBy: 'id');
    return rawResult;
  }
}
