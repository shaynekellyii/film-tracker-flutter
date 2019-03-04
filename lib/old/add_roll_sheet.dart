//import 'package:film_tracker/roll/add_roll_form.dart';
//import 'package:film_tracker/roll/roll_bloc.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//class AddRollSheet extends StatefulWidget {
//  AddRollSheet({@required this.bloc});
//
//  final RollFormBloc bloc;
//
//  @override
//  State<StatefulWidget> createState() => _AddRollSheetState(bloc);
//}
//
//class _AddRollSheetState extends State<AddRollSheet> {
//  _AddRollSheetState(this.bloc);
//
//  final RollFormBloc bloc;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Wrap(children: <Widget>[
//        Container(
//          alignment: Alignment(0.0, 0.0),
//          child: Text(
//            'Add a new roll',
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
//          ),
//          padding: EdgeInsets.only(top: 16.0),
//        ),
//        Padding(
//          child: AddRollForm(),
//          padding:
//              EdgeInsets.only(bottom: 32.0, left: 32.0, right: 32.0, top: 8.0),
//        ),
//      ]),
//    );
//  }
//}
