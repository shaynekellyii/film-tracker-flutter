import 'dart:convert';

import 'package:flutter/material.dart';

Roll rollFromJson(String string) => Roll.fromJson(json.decode(string));

String jsonFromRoll(Roll roll) => json.encode(roll.toJson());

class Roll {
  int id;
  String name;
  DateTime dateTime;
  String camera;
  int iso;
  int push;

  Roll({
    this.id,
    @required this.name,
    @required this.dateTime,
    @required this.camera,
    @required this.iso,
    @required this.push,
  });

  Roll.empty();

  factory Roll.fromJson(Map<String, dynamic> json) => Roll(
        id: json['id'],
        name: json['name'],
        dateTime: json['dateTime'],
        camera: json['camera'],
        iso: json['iso'],
        push: json['push'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateTime': dateTime,
        'camera': camera,
        'iso': iso,
        'push': push,
      };

  @override
  String toString() {
    return 'Roll{id: $id, name: $name, dateTime: $dateTime, camera: $camera, iso: $iso, push: $push}';
  }
}
