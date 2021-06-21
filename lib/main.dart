import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';

import 'package:myflutter/pages/home.dart';
import 'package:myflutter/pages/menu.dart';
import 'package:myflutter/pages/welcome.dart';
import 'package:myflutter/pages/login.dart';
import 'package:myflutter/pages/welcome.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/provider/auth_provider.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'dart:async';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProvider(create: (_)=>ArticleProvider())
      ],
      child:  MaterialApp(
        title: 'Login Registration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:Center(
        child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text("${snapshot.error}");
                  else if (snapshot.data == null)
                    return Login();
                  else {
                    UserPreferences().removeUser();
                    return Welcome();
                  }



              }
            },

            ),


        )

        ),
      );

  }

}






