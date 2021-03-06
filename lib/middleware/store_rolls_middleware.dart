import 'package:film_tracker/data/db/roll_dao.dart';
import 'package:film_tracker/data/roll_repository.dart';
import 'package:film_tracker/actions/actions.dart';
import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/selectors/selectors.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreRollsMiddleware([
  RollRepository repository = const RollRepository(
    rollDao: const RollDao(),
  ),
]) {
  final loadRolls = _createLoadRolls(repository);
  final saveRolls = _createSaveRolls(repository);

  return [
    TypedMiddleware<AppState, LoadRollsAction>(loadRolls),
    TypedMiddleware<AppState, DeleteRollAction>(saveRolls),
  ];
}

Middleware<AppState> _createLoadRolls(RollRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadRolls().then((rolls) {
      store.dispatch(RollsLoadedAction(rolls));
    }).catchError((_) => store.dispatch(RollsNotLoadedAction()));
    next(action);
  };
}

Middleware<AppState> _createSaveRolls(RollRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveRolls(rollsSelector(store.state));
  };
}
