import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hello'),),
        body: Column(
          children: <Widget>[
            Text('what is ur name'),
            RaisedButton(onPressed: null,child: Text('ans1'),),
            RaisedButton(onPressed: null,child: Text('ans2'),),
            RaisedButton(onPressed: null,child: Text('ans3'),),
          ],
        ),
      ),
    );
  }
}
