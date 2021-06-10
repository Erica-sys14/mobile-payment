import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(child: Text(user.getUser().toString())),
          SizedBox(height: 100),
          MaterialButton(
            onPressed: () {
              UserPreferences().removeUser();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text("Logout"),
            color: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
