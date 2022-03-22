import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lotto/data/lotto.dart';

class DatabaseHelper {

  static final _databaseName = "getchaLotto.db";
  static final _databaseVersion = 2;
  static final lottoTable = "getchaLotto";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    return await openDatabase(path, version:  _databaseVersion, onCreate: _onCreate,
    onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {

    await db.execute('''    
    CREATE TABLE IF NOT EXISTS $lottoTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      numbers String,
      date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}
    //입력, 수정, 불러오기


  Future<int> insertLotto(Lotto lotto) async {
    Database? db = await instance.database;

      Map<String, dynamic> row = {
        "numbers" : lotto.numbers,
      };

      return await db!.insert(lottoTable, row);
  }


  Future deleteLotto(Lotto lotto) async {
    Database? db = await instance.database;

    return await db!.delete(lottoTable, where: "id = ?", whereArgs: [lotto.id]);
  }

  Future<List<Map<String, dynamic>>> getAllLotto() async {
    Database? db = await instance.database;
    return await db!.query(lottoTable);
  }

  Future dropTable(String TableName) async {
    Database? db = await instance.database;
    return await db!.delete(TableName);
  }

}