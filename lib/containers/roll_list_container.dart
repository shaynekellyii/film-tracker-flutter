import 'package:film_tracker/actions/actions.dart';
import 'package:film_tracker/models/app_state.dart';
import 'package:film_tracker/models/roll.dart';
import 'package:film_tracker/presentation/roll_list.dart';
import 'package:film_tracker/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RollListContainer extends StatelessWidget {
  RollListContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return RollList(
          rolls: vm.rolls,
          onRemove: vm.onRemove,
          onUndoRemove: vm.onUndoRemove,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Roll> rolls;
  final bool loading;
  final Function(Roll) onRemove;
  final Function(Roll) onUndoRemove;

  _ViewModel({
    @required this.rolls,
    @required this.loading,
    @required this.onRemove,
    @required this.onUndoRemove,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        rolls: rollsSelector(store.state),
        loading: store.state.isLoading,
        onRemove: (roll) {
          store.dispatch(DeleteRollAction(roll.id));
        },
        onUndoRemove: (roll) {
          store.dispatch(AddRollAction(roll));
        });
  }
}
