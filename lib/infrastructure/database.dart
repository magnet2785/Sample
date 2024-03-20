import "package:sample/importer.dart";

class Memo {
  final int id;
  final String title;
  final String content;
  final DateTime date;

  Memo({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }
}

final Future<Database> database = openDatabase(
  join('memo_database.db'),
  onCreate: (db, version) {
    return db.execute(
      "CREATE TABLE memos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, date TEXT)",
    );
  },
  version: 1,
);

//memo を追加
Future<void> insertMemo(Memo memo) async {
  final Database db = await database;

  await db.insert(
    'memos',
    memo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

//memo を取得
Future<List<Memo>> memos() async {
  final Database db = await database;

  final List<Map<String, dynamic>> maps = await db.query('memos');

  return List.generate(maps.length, (i) {
    return Memo(
      id: maps[i]['id'],
      title: maps[i]['title'],
      content: maps[i]['content'],
      date: DateTime.parse(maps[i]['date']),
    );
  });
}

//memo を更新
Future<void> updateMemo(Memo memo) async {
  final db = await database;

  await db.update(
    'memos',
    memo.toMap(),
    where: "id = ?",
    whereArgs: [memo.id],
  );
}

//memo を削除
Future<void> deleteMemo(int id) async {
  final db = await database;

  await db.delete(
    'memos',
    where: "id = ?",
    whereArgs: [id],
  );
}
