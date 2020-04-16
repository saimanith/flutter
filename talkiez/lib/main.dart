import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _url = "https://api.bzinga.com/api/v1/content/languages";


  StreamController _streamController;
  Stream _stream;

//Timer _debounce;

  _search() async {
    Response response = await get(_url);
    _streamController.add(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
    _search();
  }

/*
@override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      var converted = json.decode(response.body);
      data = converted["data"];
      print(data);
    });
    return "Success";
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /* appBar: AppBar(
          title: new Text(
            "Takiez",
            textAlign: TextAlign.center,
          ),
        ),*/
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(top: 40, right: 25),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "x",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                onTap: null,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 70),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "select video languages",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "see videos made in these languages",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: StreamBuilder<Object>(
                        stream: _stream,
                        builder: (context, snapshot) {
                          return GridView.builder(
                            itemCount: snapshot.data['data'].length,

                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              // Utf8Codec utf8 = Utf8Codec();
                              //var encoded=utf8.encode(data[index]["translation"]);
                              //var decoded=utf8.decode(encoded);
                              //print(data[index]['translation']);
                              //print(decoded);
                              bool selected=false;

                              return new Card(

                                color: Colors.black,
                                child: GestureDetector(

                                  onTap: () {
                                    print('clicked ${snapshot.data[index]['id']}');
                                    setState(() {
                                      selected = !selected;

                                    });
                                  },
                                  child: new GridTile(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border:
                                          Border.all(color: Colors.grey, width: 0.4),
                                          borderRadius: BorderRadius.circular(8)),
                                      // alignment: Alignment.center,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              //alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                top: 30,
                                              ),
                                              child: new Text(snapshot.data[index]['value'],
                                                style: TextStyle(color:selected ? Colors.red : Colors.white),
                                              ),
                                            ),
                                            Container(
                                              //alignment: Alignment.center,
                                              //padding: const EdgeInsets.all(10.0),
                                              child: new Text(snapshot.data[index]['translation'],
                                                style: TextStyle(color:selected ? Colors.red : Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ), //just for testing, will fill with image later
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.4),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 3.0, left: 4.0, bottom: 4),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
