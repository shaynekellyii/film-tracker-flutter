import 'package:film_tracker/models/keys.dart';
import 'package:film_tracker/models/roll.dart';
import 'package:flutter/material.dart';

class RollItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Roll roll;

  const RollItem({
    Key key,
    this.onDismissed,
    this.onTap,
    this.roll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Keys.rollItem(roll.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.camera_roll, color: Colors.grey),
        title: Hero(
          tag: '${roll.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              roll.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        subtitle: Text(
          roll.camera,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
