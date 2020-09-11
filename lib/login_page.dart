import 'package:flutter/material.dart';
import 'package:hot_byte_user/signin.dart';

import 'first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    CircleAvatar(
                      //child: ImageRotate(),
                      radius: 150,
                      backgroundImage: AssetImage("assets/hot_byte.png"),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      height: 45.0,
                      width: 200,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.lightBlueAccent[100],
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            await signInWithGoogle().whenComplete(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MyHomePage();
                                  },
                                ),
                              );
                            });
                          },
                          child: Center(
                            child: Text(
                              "Let's Dive In",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Image(
                      image: AssetImage("assets/back.jpg"),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
