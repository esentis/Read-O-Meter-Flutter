import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'calculate_readtime.dart';

var logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String minutes = '';
  String seconds = '';
  String words = '';
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Words: $words \nMinutes: $minutes \nSeconds: $seconds',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      words = 0.toString();
                    }
                    var duration = calculateReadTime(value);
                    minutes = duration['minutes'].toString();
                    seconds = duration['seconds'].toString();
                    words = duration['words'].toString();
                    setState(() {});
                  },
                  cursorColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
