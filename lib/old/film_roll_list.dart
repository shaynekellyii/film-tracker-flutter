//import 'package:film_tracker/redux/models/roll.dart';
//import 'package:film_tracker/roll/roll_bloc.dart';
//import 'package:flutter/material.dart';
//
//class FilmRollList extends StatefulWidget {
//  FilmRollList({@required this.bloc});
//
//  final RollFormBloc bloc;
//
//  @override
//  State<StatefulWidget> createState() => _FilmRollListState();
//}
//
//class _FilmRollListState extends State<FilmRollList> {
//  // TODO: Separate bloc for roll list
//  final _bloc = RollFormBloc();
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<List<Roll>>(
//      stream: _bloc.rolls,
//      builder: (BuildContext context, AsyncSnapshot snapshot) {
//        if (snapshot.hasData) {
//          List<Roll> rolls = snapshot.data;
//          if (rolls.isNotEmpty) {
//            return ListView.builder(
//              itemCount: rolls.length,
//              itemBuilder: (BuildContext context, int index) => Dismissible(
//                    background: Container(color: Colors.red),
//                    child: ListTile(
//                      title: Text(rolls[index].toString()),
//                    ),
//                    key: Key(rolls[index].toString()),
//                    onDismissed: (direction) {
//                      final roll = rolls[index];
//                      _bloc.deleteRoll(roll.id);
//                      Scaffold.of(context).showSnackBar(
//                          SnackBar(content: Text('${roll.name} deleted')));
//                    },
//                  ),
//            );
//          } else {
//            return Center(child: Text('You have no rolls yet!'));
//          }
//        } else if (snapshot.hasError) {
//          return Center(child: Text('Error: ${snapshot.error}'));
//        } else {
//          return Center(child: CircularProgressIndicator());
//        }
//      },
//    );
//  }
//
//  @override
//  void dispose() {
//    _bloc.dispose();
//    super.dispose();
//  }
//}
