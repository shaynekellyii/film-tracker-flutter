import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/reducers/loading_reducer.dart';
import 'package:film_tracker/reducers/rolls_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    rolls: rollsReducer(state.rolls, action),
  );
}
