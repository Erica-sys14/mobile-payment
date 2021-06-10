import 'package:flutter/material.dart';
import 'package:myflutter/pages/home.dart';
import 'package:myflutter/pages/login.dart';
import 'package:myflutter/pages/welcome.dart';
import 'package:myflutter/provider/auth_provider.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'dart:async';
import 'dart:math';

import 'package:provider/provider.dart';
import 'domains/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData () => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        ChangeNotifierProvider(create: (_)=>UserProvider())
      ],
      child:  MaterialApp(
        title: 'Login Registration',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home:
        FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else if (snapshot.data == null)
                    return Login();
                  else {
                    UserPreferences().removeUser();
                  }
                  return Welcome();

              }
            }),
      ),
    );


  }
}



