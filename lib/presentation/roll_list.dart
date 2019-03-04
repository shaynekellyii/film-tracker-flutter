import 'package:film_tracker/containers/app_loading.dart';
import 'package:film_tracker/models/keys.dart';
import 'package:film_tracker/models/roll.dart';
import 'package:film_tracker/presentation/loading_indicator.dart';
import 'package:film_tracker/presentation/roll_item.dart';
import 'package:flutter/material.dart';

class RollList extends StatelessWidget {
  final List<Roll> rolls;
  final Function(Roll) onRemove;
  final Function(Roll) onUndoRemove;

  RollList({
    Key key,
    @required this.rolls,
    @required this.onRemove,
    @required this.onUndoRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      builder: (BuildContext context, bool isLoading) {
        return isLoading ? LoadingIndicator() : _buildRollListView();
      },
    );
  }

  ListView _buildRollListView() {
    return ListView.builder(
      key: Keys.rollList,
      itemCount: rolls.length,
      itemBuilder: (context, index) {
        final roll = rolls[index];
        return RollItem(
          roll: roll,
          onDismissed: (_) => _removeRoll(context, roll),
          onTap: null,
        );
      },
    );
  }

  void _removeRoll(BuildContext context, Roll roll) {
    onRemove(roll);
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Roll deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () => onUndoRemove(roll),
        )));
  }
}
