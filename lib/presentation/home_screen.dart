import 'package:film_tracker/containers/roll_list_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({Key key, @required this.onInit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Film tracker')),
      body: RollListContainer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => null,
        icon: Icon(Icons.add),
        label: Text('Add a new roll'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
