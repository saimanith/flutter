import 'dart:convert';

import 'main.dart';
import 'dart:async';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class service extends StatelessWidget {

  Future<List<Languages>> getLanguagesofapi() async {
    var data = await http.get(
        "https://api.bzinga.com/api/v1/content/languages");
    var jsondata = jsonDecode(data.body);
    var layer = jsondata["data"];
    List<Languages> languages = [];
    for (var u in layer) {
      Languages language = Languages(u["id"],u["key"],u["value"],u["traslation"]);
      languages.add(language);
    }
    return languages;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Languages{
  final String id;
  final String key;
  final String value;
  final String translation;
  Languages(this.id,this.key,this.value,this.translation);


}