//import 'package:film_tracker/roll/add_roll_sheet.dart';
//import 'package:film_tracker/roll/film_roll_list.dart';
//import 'package:film_tracker/roll/roll_bloc.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//class FilmRollScreen extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _FilmRollScreenState();
//}
//
//class _FilmRollScreenState extends State<FilmRollScreen> {
//  final _bloc = RollFormBloc();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: Column(
//          children: <Widget>[
//            Container(
//              alignment: Alignment(-1.0, -1.0),
//              child: Text(
//                'Film rolls',
//                style: TextStyle(
//                  fontSize: 32.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              padding: EdgeInsets.all(
//                32.0,
//              ),
//            ),
//            Expanded(child: FilmRollList(bloc: _bloc)),
//          ],
//          mainAxisAlignment: MainAxisAlignment.start,
//        ),
//      ),
//      bottomNavigationBar: BottomAppBar(
//        child: new Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.menu),
//              onPressed: () {},
//            ),
//            IconButton(
//              icon: Icon(Icons.search),
//              onPressed: () {},
//            ),
//          ],
//        ),
//        color: Colors.white,
//        notchMargin: 4.0,
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: FloatingActionButton.extended(
//        elevation: 4.0,
//        icon: Icon(Icons.add),
//        label: Text('Add a roll'),
//        onPressed: () {
//          _openBottomSheet(_bloc);
//        },
//      ),
//    );
//  }
//
//  _openBottomSheet(final RollFormBloc bloc) {
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext bc) {
//          return AddRollSheet(bloc: bloc);
//        });
//  }
//}
