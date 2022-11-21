import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mood_calendar/components/box.dart';

import '../list_data/quotes_.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late final List<Content> _content = [];

  Future<void> _handleOnRefresh() async {
    fetchJson(Random).then((value) {
      setState(() {
        _content.addAll(value);
        _content.shuffle();
      });
    });
  }

  Future<List<Content>> fetchJson(jsondata) async {
    var reponse =
        await http.get(Uri.parse('https://www.jsonkeeper.com/b/4DEZ'));
    //!Api for the json text

    late List<Content> ulist = [];

    if (reponse.statusCode == 200) {
      var urjson = json.decode(reponse.body);

      for (var jsondata in urjson) {
        ulist.add(Content.fromJson(jsondata));
      }
    }
    return ulist;
  }

  @override
  void initState() {
    fetchJson(context).then((value) {
      setState(() {
        _content.addAll(value);
        _content.shuffle();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: LiquidPullToRefresh(
                backgroundColor:
                    Colors.deepPurple.shade700.withBlue(255).withOpacity(0.4),
                color: Colors.transparent,
                height: 150,
                onRefresh: _handleOnRefresh,
                showChildOpacityTransition: false,
                animSpeedFactor: 4,
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SafeArea(
                      child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return (Box(
                            text: _content[index].quote.toString(),
                          ));
                        }),
                        itemCount: _content.length >= 10 ? 10 : _content.length,
                      ),
                    )))));
  }
}
