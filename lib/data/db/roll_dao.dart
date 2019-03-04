import 'package:film_tracker/data/db/database.dart';
import 'package:film_tracker/models/roll.dart';

class RollDao {

  const RollDao();

  static const _dbProvider = DbProvider();

  /// CREATE: Inserts a roll and returns its id.
  Future<int> insertRoll(Roll roll) async {
    final db = await _dbProvider.database;
    return await db.insert('Roll', roll.toJson());
  }

  /// READ: Fetches a roll by ID.
  getRoll(final int id) async {
    final db = await _dbProvider.database;
    var rolls = await db.query('Roll', where: 'id = ?', whereArgs: [id]);
    return rolls.isNotEmpty ? Roll.fromJson(rolls.first) : Null;
  }

  /// READ: Fetches all rolls.
  Future<List<Roll>> getAllRolls() async {
    final db = await _dbProvider.database;
    var rolls = await db.query('Roll');
    return rolls.isNotEmpty
        ? rolls.map((roll) => Roll.fromJson(roll)).toList()
        : [];
  }

  /// UPDATE: Update single roll
  updateRoll(final Roll roll) async {
    final db = await _dbProvider.database;
    return await db
        .update('Roll', roll.toJson(), where: 'id = ?', whereArgs: [roll.id]);
  }

  /// DELETE: Delete single roll
  deleteRoll(final int id) async {
    final db = await _dbProvider.database;
    db.delete('Roll', where: 'id = ?', whereArgs: [id]);
  }

  /// DELETE: Delete all rolls
  deleteAllRolls() async {
    final db = await _dbProvider.database;
    db.rawDelete('DELETE * FROM Roll');
  }
}
