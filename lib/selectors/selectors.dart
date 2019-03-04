import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/models/roll.dart';

List<Roll> rollsSelector(AppState state) => state.rolls;

bool isLoadingSelector(AppState state) => state.isLoading;
