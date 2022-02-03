import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lotto/data/lotto.dart';

class DatabaseHelper {

  static final _databaseName = "getchaLotto.db";
  static final _databaseVersion = 1;
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
      date INTEGER DEFAULT 0,
      title String,
      memo String,
      color INTEGER,
      done INTEGER,
      category String
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}
    //투도 입력, 수정, 불러오기

  Future<int> insertLotto(Lotto lotto) async {
    Database? db = await instance.database;

      Map<String, dynamic> row = {
        "title" : lotto.title,
        "date" : lotto.date,
        "memo" : lotto.memo,
        "color" : lotto.color,
        "done" : lotto.done,
        "category" : lotto.category
      };

      return await db!.insert(lottoTable, row);
    }
  }