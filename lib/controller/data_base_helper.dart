import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'shubudo_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
     CREATE TABLE Faixas (
        id INTEGER PRIMARY KEY,
        cor TEXT NOT NULL
);
    ''');

    await db.execute('''
      CREATE TABLE Padroes (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        tipo TEXT NOT NULL,
        base TEXT NOT NULL,
        observacao TEXT,
        faixa_cor TEXT,
        FOREIGN KEY (faixa_cor) REFERENCES Faixas(cor)
);
    ''');

    await db.execute('''
      CREATE TABLE Katas (
        id INTEGER PRIMARY KEY,
        forma INTEGER NOT NULL,
        sequencia TEXT,
        observacao TEXT,
        faixa_cor TEXT,
        FOREIGN KEY (faixa_cor) REFERENCES Faixas(cor)
);
    ''');

    await db.execute('''
      CREATE TABLE SequenciasDeCombate (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        movimentos INTEGER NOT NULL,
        sequencia TEXT,
        observacao TEXT,
        faixa_cor TEXT,
        FOREIGN KEY (faixa_cor) REFERENCES Faixas(cor)
);
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    final db = await database;
    return await db.query(table);
  }
}
