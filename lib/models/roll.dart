import 'dart:convert';

import 'package:flutter/material.dart';

Roll rollFromJson(String string) => Roll.fromJson(json.decode(string));

String jsonFromRoll(Roll roll) => json.encode(roll.toJson());

class Roll {
  int id;
  String name;
  String date;
  String time;
  String camera;
  int iso;
  int push;

  Roll({
    this.id,
    @required this.name,
    @required this.date,
    @required this.time,
    @required this.camera,
    @required this.iso,
    @required this.push,
  });

  Roll.empty();

  factory Roll.fromJson(Map<String, dynamic> json) => Roll(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        time: json['time'],
        camera: json['camera'],
        iso: json['iso'],
        push: json['push'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'time': time,
        'camera': camera,
        'iso': iso,
        'push': push,
      };

  @override
  String toString() {
    return '''id: $id, name: $name, date: $date, time: $time, camera: $camera,
    iso: $iso, push: $push''';
  }
}
