import 'package:film_tracker/actions/actions.dart';
import 'package:film_tracker/middleware/store_rolls_middleware.dart';
import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/presentation/home_screen.dart';
import 'reducers/app_state_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(FilmTrackerApp());

class FilmTrackerApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreRollsMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Film tracker',
        theme: ThemeData(
          fontFamily: 'Roboto Mono',
          primaryColor: Colors.blue,
        ),
        routes: {
          '/': (context) => HomeScreen(
                onInit: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(LoadRollsAction());
                },
              ),
        },
      ),
    );
  }
}
