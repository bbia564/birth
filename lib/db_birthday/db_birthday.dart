
import 'package:birthday_record/db_birthday/birthday_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBBirthday extends GetxService {
  late Database dbBase;

  Future<DBBirthday> init() async {
    await createBirthdayDB();
    return this;
  }

  createBirthdayDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'birthday.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBirthdayTable(db);
        });
  }

  createBirthdayTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS birthday (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, nickname TEXT, mark TEXT, birthday TEXT)');
  }

  insertBirthday(BirthdayEntity entity) async {
    final id = await dbBase.insert('birthday', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'nickname': entity.nickname,
      'mark': entity.mark,
      'birthday': entity.birthday.toIso8601String(),
    });
    return id;
  }

  updateBirthday(BirthdayEntity entity) async {
    await dbBase.update('birthday', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'nickname': entity.nickname,
      'mark': entity.mark,
      'birthday': entity.birthday.toIso8601String(),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanBirthdayData() async {
    await dbBase.delete('birthday');
  }

  Future<List<BirthdayEntity>> getBirthdayAllData() async {
    var result = await dbBase.query('birthday', orderBy: 'createdTime DESC');
    return result.map((e) => BirthdayEntity.fromJson(e)).toList();
  }
}
