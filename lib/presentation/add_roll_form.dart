import 'package:film_tracker/models/roll.dart';
import 'package:flutter/material.dart';

typedef OnSaveCallback = Function(Roll roll);

class AddRollForm extends StatefulWidget {
//  final bool isEditing;
  final OnSaveCallback onSave;
  final Roll roll;

  AddRollForm({
    Key key,
//    @required this.isEditing,
    @required this.onSave,
    this.roll,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddRollFormState();
}

class _AddRollFormState extends State<AddRollForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//  bool get isEditing => widget.isEditing;

  String _name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      return value.trim().isEmpty ? 'Please enter a name' : null;
                    },
                    onSaved: (value) => _name = value,
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                widget.onSave(Roll(
                  camera: 'Canon',
                  name: _name,
                  date: 'date',
                  time: 'time',
                  push: 1,
                  iso: 400,
                ));
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.save),
            label: Text('Save'),
          )
        ],
      ),
    );
  }
}
