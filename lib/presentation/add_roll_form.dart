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
  String _camera;
  String _date;
  String _time;
  int _iso;
  int _push;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Add a new roll'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    _getNameField(),
                    _getCameraField(),
                    _getDateField(),
                    _getTimeField(),
                    _getIsoField(),
                    _getPushField(),
                  ],
                ),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: _onSavePressed,
              icon: Icon(Icons.save),
              label: Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  void _onSavePressed() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onSave(Roll(
        camera: _camera,
        name: _name,
        date: _date,
        time: _time,
        push: _push,
        iso: _iso,
      ));
      Navigator.pop(context);
    }
  }

  TextFormField _getNameField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.camera_roll),
        labelText: 'Roll name',
      ),
      validator: (value) {
        return value.trim().isEmpty ? 'Please enter a name' : null;
      },
      onSaved: (value) => _name = value,
    );
  }

  TextFormField _getCameraField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.camera_alt),
        labelText: 'Camera',
      ),
      validator: (value) {
        return value.trim().isEmpty ? 'Please enter a camera' : null;
      },
      onSaved: (value) => _camera = value,
    );
  }

  TextFormField _getDateField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Date',
      ),
      validator: (value) {
        return value.trim().isEmpty ? 'Please enter a date' : null;
      },
      onSaved: (value) => _date = value,
    );
  }

  TextFormField _getTimeField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.access_time),
        labelText: 'Time',
      ),
      validator: (value) {
        return value.trim().isEmpty ? 'Please enter a time' : null;
      },
      onSaved: (value) => _time = value,
    );
  }

  TextFormField _getIsoField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.lightbulb_outline),
        labelText: 'ISO',
      ),
      validator: (value) {
        return value.trim().isEmpty || int.tryParse(value.trim()) == null
            ? 'Please enter an ISO value'
            : null;
      },
      onSaved: (value) => _iso = int.parse(value),
    );
  }

  TextFormField _getPushField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.iso),
        labelText: 'Push/pull (+/-)',
      ),
      validator: (value) {
        return value.trim().isEmpty || int.tryParse(value.trim()) != null
            ? 'Please enter a push/pull value'
            : null;
      },
      onSaved: (value) => _push = int.parse(value),
    );
  }
}
