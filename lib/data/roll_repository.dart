import 'dart:async';

import 'package:film_tracker/data/db/roll_dao.dart';
import 'package:film_tracker/models/roll.dart';
import 'package:meta/meta.dart';

class RollRepository {
  final RollDao rollDao;

  const RollRepository({@required this.rollDao});

  Future<List<Roll>> loadRolls() async => rollDao.getAllRolls();
}
