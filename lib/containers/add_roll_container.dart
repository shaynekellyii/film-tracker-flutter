import 'package:film_tracker/actions/actions.dart';
import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/presentation/add_roll_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AddRollContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      distinct: true,
      converter: (Store<AppState> store) {
        return (roll) {
          store.dispatch(AddRollAction(roll));
        };
      },
      builder: (context, onSave) {
        return AddRollForm(onSave: onSave);
      },
    );
  }
}
