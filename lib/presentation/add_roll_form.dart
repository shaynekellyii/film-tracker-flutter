import 'package:film_tracker/models/roll.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _dateFormat = DateFormat('E, MMM d, y');
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

//  bool get isEditing => widget.isEditing;

  String _name;
  String _camera;
  DateTime _dateTime;
  TimeOfDay _timeOfDay;
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
                    _getDateField(_dateController),
                    _getTimeField(_timeController),
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
        dateTime: DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _timeOfDay.hour, _timeOfDay.minute),
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

  Widget _getDateField(final TextEditingController controller) {
    return GestureDetector(
      onTap: () => _openDatePicker(controller),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: 'Date',
          ),
          validator: (value) {
            return value.trim().isEmpty ? 'Please enter a date' : null;
          },
        ),
      ),
    );
  }

  void _openDatePicker(final TextEditingController controller) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        builder: (context, child) =>
            Theme(data: ThemeData.light(), child: child)).then((dateTime) {
      controller.text = _dateFormat.format(dateTime);
      _dateTime = dateTime;
    });
  }

  Widget _getTimeField(final TextEditingController controller) {
    return GestureDetector(
      onTap: () => _openTimePicker(controller),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration:
              InputDecoration(icon: Icon(Icons.access_time), labelText: 'Time'),
          validator: (value) {
            return value.trim().isEmpty ? 'Please enter a time' : null;
          },
        ),
      ),
    );
  }

  void _openTimePicker(final TextEditingController controller) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((timeOfDay) {
      controller.text = timeOfDay.format(context);
      _timeOfDay = timeOfDay;
    });
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
        return value.trim().isEmpty || int.tryParse(value.trim()) == null
            ? 'Please enter a push/pull value'
            : null;
      },
      onSaved: (value) => _push = int.parse(value),
    );
  }
}
