import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hot_byte_user/login_page.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void initialiseApp() async {
    await Firebase.initializeApp();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initialiseApp();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
