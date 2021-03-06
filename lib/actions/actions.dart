import 'package:film_tracker/models/roll.dart';

class LoadRollsAction {}

class RollsNotLoadedAction {}

class DeleteRollAction {
  final int rollId;

  DeleteRollAction(this.rollId);

  @override
  String toString() {
    return 'DeleteRollAction{rollId: $rollId}';
  }
}

class RollsLoadedAction {
  final List<Roll> rolls;

  RollsLoadedAction(this.rolls);

  @override
  String toString() {
    return 'RollsLoadedAction{rolls: $rolls}';
  }
}

class AddRollAction {
  final Roll roll;

  AddRollAction(this.roll);

  @override
  String toString() {
    return 'AddRollAction{roll: $roll}';
  }
}
