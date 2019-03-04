//import 'package:film_tracker/base/bloc_provider.dart';
//import 'package:film_tracker/roll/roll_bloc.dart';
//import 'package:flutter/material.dart';
//
//class AddRollForm extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final bloc = BlocProvider.of(context);
//    return Container(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            nameField(bloc),
//            dateField(bloc),
//          ],
//        )
//    );
//  }
//
//  Widget nameField(RollFormBloc bloc) {
//    return StreamBuilder(
//      stream: bloc.name,
//      builder: (context, snapshot) {
//        return TextField(
//          onChanged: bloc.onNameChanged,
//          decoration: InputDecoration(
//              focusedBorder:
//              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//              fillColor: Colors.black,
//              icon: Icon(Icons.camera_roll, color: Colors.grey),
//              labelText: 'Name',
//              labelStyle: TextStyle(color: Colors.black)),
//        );
//      },
//    );
//  }
//
//  Widget dateField(RollFormBloc bloc) {
//    return StreamBuilder(
//      stream: bloc.date,
//      builder: (context, snapshot) {
//        return TextField(
//          onChanged: bloc.onDateChanged,
//          decoration: InputDecoration(
//              focusedBorder:
//              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//              fillColor: Colors.black,
//              icon: Icon(Icons.camera_roll, color: Colors.grey),
//              labelText: 'Name',
//              labelStyle: TextStyle(color: Colors.black)),
//        );
//      },
//    );
//  }
//
//  Widget submitButton(RollFormBloc bloc) {
//    return StreamBuilder(
//      stream: bloc.isFormValid,
//      builder: (context, snapshot) =>
//          FloatingActionButton.extended(
//            icon: Icon(Icons.check),
//            label: Text('Done'),
//            onPressed: snapshot.hasData ? bloc.submit() : null,
//          ),
//    );
//  }
//}
////class AddRollForm extends StatefulWidget {
////  AddRollForm(this.bloc);
////
////  final RollFormBloc bloc;
////
////  @override
////  _AddRollFormState createState() => _AddRollFormState(bloc);
////}
////
////class _AddRollFormState extends State<AddRollForm> {
////  _AddRollFormState(this.bloc);
////
////  final RollFormBloc bloc;
////  final _formKey = GlobalKey<FormState>();
////
////  @override
////  Widget build(BuildContext context) {
////    return Form(
////      key: _formKey,
////      child: Column(
////        crossAxisAlignment: CrossAxisAlignment.start,
////        children: <Widget>[
////          BlackFormField(
////            icon: Icons.camera_roll,
////            label: 'Name',
////            controller: TextEditingController(),
////          ),
////          Row(
////            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////            children: <Widget>[
////              Flexible(
////                child: BlackFormField(
////                  icon: Icons.calendar_today,
////                  label: 'Date',
////                  onSaved: (date) => _roll.date = date,
////                ),
////              ),
////              Flexible(
////                child: BlackFormField(
////                  icon: Icons.access_time,
////                  label: 'Time',
////                  onSaved: (time) => _roll.time,
////                ),
////              ),
////            ],
////          ),
////          Container(
////            child: Row(
////              children: <Widget>[
////                Padding(
////                  child: Icon(Icons.camera_alt, color: Colors.grey),
////                  padding: EdgeInsets.only(right: 16.0),
////                ),
////                Expanded(
////                  child: DropdownButton<String>(
////                    hint: Text('Camera', style: TextStyle(color: Colors.black)),
////                    isExpanded: true,
////                    items: <String>['Canon FTb-QL', 'Nikon F55']
////                        .map((String value) {
////                      return DropdownMenuItem<String>(
////                          child: Text(value), value: value);
////                    }).toList(),
////                    onChanged: (camera) {
////                      _roll.camera = camera;
////                      setState(() {});
////                    },
////                    value: _roll.camera,
////                  ),
////                ),
////              ],
////            ),
////            padding: EdgeInsets.only(top: 16.0),
////          ),
////          Row(
////            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////            children: <Widget>[
////              Flexible(
////                child: BlackFormField(
////                  icon: Icons.wb_sunny,
////                  keyboardType: TextInputType.numberWithOptions(),
////                  label: 'ISO',
////                  onSaved: (String iso) => _roll.iso = int.parse(iso),
////                ),
////              ),
////              Flexible(
////                child: BlackFormField(
////                  icon: Icons.exposure,
////                  keyboardType: TextInputType.numberWithOptions(signed: true),
////                  label: 'Push/pull',
////                  onSaved: (String push) => _roll.push = int.parse(push),
////                ),
////              ),
////            ],
////          ),
////          Container(
////            alignment: Alignment(0.0, 0.0),
////            child: FloatingActionButton.extended(
////              onPressed: () {
////                if (_formKey.currentState.validate()) _submit(_roll);
////              },
////              icon: Icon(Icons.check),
////              label: Text('Done'),
////            ),
////            padding: EdgeInsets.only(top: 24.0),
////          ),
////        ],
////      ),
////    );
////  }
////
////  _submit(Roll roll) {
////    bloc.addRoll(roll);
////  }
