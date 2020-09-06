import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HotByte"),
          centerTitle: true,
          
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text("RItik jain"),
            SizedBox(height: 10,),
            Text("Kunal mod"),
            
          ],)

        ),
      ),
    );
  }
}

