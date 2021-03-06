import 'package:film_tracker/actions/actions.dart';
import 'package:film_tracker/models/roll.dart';
import 'package:redux/redux.dart';

final rollsReducer = combineReducers<List<Roll>>([
  TypedReducer<List<Roll>, AddRollAction>(_addRoll),
  TypedReducer<List<Roll>, RollsLoadedAction>(_setLoadedRolls),
  TypedReducer<List<Roll>, RollsNotLoadedAction>(_setNoRolls),
  TypedReducer<List<Roll>, DeleteRollAction>(_deleteRoll),
]);

List<Roll> _addRoll(List<Roll> rolls, AddRollAction action) =>
    List.from(rolls)..add(action.roll);

List<Roll> _setLoadedRolls(List<Roll> rolls, RollsLoadedAction action) =>
    action.rolls;

List<Roll> _setNoRolls(List<Roll> rolls, RollsNotLoadedAction action) => [];

List<Roll> _deleteRoll(List<Roll> rolls, DeleteRollAction action) =>
    List.from(rolls)..removeWhere((roll) => roll.id == action.rollId);
