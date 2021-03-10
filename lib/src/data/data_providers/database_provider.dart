import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../data.dart';

class DatabaseProvider {
  /// Database name
  final String dbName = 'Favorite_Dashatars.db';

  /// Singleton
  static final DatabaseProvider _dbProvider = DatabaseProvider._internal();
  factory DatabaseProvider() => _dbProvider;
  DatabaseProvider._internal();

  /// Database
  Database _database;

  /// Database instance.
  Future<Database> get db async {
    if (_database == null) await _init();

    return _database;
  }

  Future<void> _init() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create [CharacteristicDoa] table
        await db.execute(CharacteristicDoa.tableCreationQuery);
      },
    );
  }

  /// Initialize database.
  Future<void> init() async => await db;
}
