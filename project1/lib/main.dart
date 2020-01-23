import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    List buildTextViews(int count) {
      List<Widget> strings = List();
      for (int i = 0; i < count; i++) {
        strings.add(new Padding(padding: new EdgeInsets.all(16.0),
            child: new Text("Item number " + i.toString(),
                style: new TextStyle(fontSize: 20.0))));
      }
      return strings;
    }

    return Scaffold(
        body: new CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
            expandedHeight: 150,
            floating:true,
            pinned: false,
            snap: false,
            title: const Text('Sliver App Bar'),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(buildTextViews(50)))
        ])
    );
  }
}