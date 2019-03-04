import 'package:flutter/foundation.dart';

class Keys {
  static final rollList = const Key('__rollList__');
  static final rollItem = (int id) => Key('RollItem__$id');
}