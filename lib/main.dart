import 'package:flutter/material.dart';
import 'package:hot_byte_user/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Loading());
  }
}
