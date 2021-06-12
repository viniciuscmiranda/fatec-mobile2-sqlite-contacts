import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Contact {
  static const String table = 'contacts';

  static const String colId = 'id';
  static const String colName = 'name';
  static const String colPhone = 'phone';
  static const String colEmail = 'email';
  static const String colPictureURL = 'picture_url';

  int id;
  String name;
  String phone;
  String email;
  String pictureURL;

  Contact({this.name, this.phone, this.email, this.pictureURL});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      colName: name,
      colPhone: phone,
      colEmail: email,
      colPictureURL: pictureURL
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  Contact.fromMap(Map<String, dynamic> map)
      : id = map[colId],
        name = map[colName],
        email = map[colEmail],
        phone = map[colPhone],
        pictureURL = map[colPictureURL];

  @override
  String toString() {
    return "Contact(id=$id, name=$name, email=$email, phone=$phone, pictureURL=$pictureURL)";
  }
}

class SQLiteOpenHelper {
  SQLiteOpenHelper.internal();
  static final SQLiteOpenHelper _instance = SQLiteOpenHelper.internal();
  factory SQLiteOpenHelper() => _instance;

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      return _database = await initDatabase();
    }
  }

  Future<Database> initDatabase() async {
    // final databasePath = await getDatabasesPath();
    // final path = join(databasePath, "contacts.db");
    final path = join(await getDatabasesPath(), "contacts.db");

    final query = '''
      CREATE TABLE IF NOT EXISTS ${Contact.table} (
        ${Contact.colId} INTEGER PRIMARY KEY,
        ${Contact.colPhone} TEXT NOT NULL,
        ${Contact.colEmail} TEXT,
        ${Contact.colPictureURL} TEXT
      )
    ''';

    openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute(query);
    });
  }

  Future<Contact> insert(Contact contact) async {
    Database db = await database;
    contact.id = await db.insert(Contact.table, contact.toMap());

    return contact;
  }
}
