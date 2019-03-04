//import 'dart:async';
//import 'package:film_tracker/base/validators.dart';
//import 'package:rxdart/rxdart.dart';
//
//import 'package:film_tracker/data/db/roll_dao.dart';
//import 'package:film_tracker/redux/models/roll.dart';
//
//class RollFormBloc extends Object with Validators {
//  final rollDao = RollDao();
//
//  final _nameController = BehaviorSubject<String>();
//  final _dateController = BehaviorSubject<String>();
//
//  Stream<String> get name => _nameController.stream.transform(validateRollName);
//
//  Stream<String> get date => _dateController.stream.transform(validateRollName);
//
//  Stream<bool> get isFormValid =>
//      Observable.combineLatest2(name, date, (n, d) => true);
//
//  Function(String) get onNameChanged => _nameController.sink.add;
//
//  Function(String) get onDateChanged => _dateController.sink.add;
//
//  submit() {
//    final validName = _nameController.value;
//    final validDate = _dateController.value;
//
//    rollDao.insertRoll(Roll(
//        id: null,
//        name: validName,
//        date: validDate,
//        time: 'time',
//        camera: 'camera',
//        iso: 1,
//        push: 1));
//  }
//
//  dispose() {
//    _nameController.close();
//    _dateController.close();
//  }
//}
//
////class RollBloc {
////  RollDao rollDao = RollDao();
////
////  RollBloc() {
////    _getRolls();
////  }
////
////  final _rollController = StreamController<List<Roll>>.broadcast();
////
////  get rolls => _rollController.stream;
////
////  _getRolls() async {
////    _rollController.sink.add(await rollDao.getAllRolls());
////  }
////
////  addRoll(Roll roll) {
////    rollDao.insertRoll(roll);
////    _getRolls();
////  }
////
////  deleteRoll(int id) {
////    rollDao.deleteRoll(id);
////    _getRolls();
////  }
////
////  editRoll(Roll updatedRoll) {
////    rollDao.updateRoll(updatedRoll);
////    _getRolls();
////  }
////
////  dispose() {
////    _rollController.close();
////  }
////}
