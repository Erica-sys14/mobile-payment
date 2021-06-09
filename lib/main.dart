import 'package:flutter/material.dart';
import 'package:myflutter/pages/welcome.dart';
import 'package:myflutter/providers/auth_provider.dart';
import 'package:myflutter/pages/login.dart';
import 'package:myflutter/providers/user_provider.dart';
import 'package:myflutter/util/share_preference.dart';
import 'package:provider/provider.dart';
import 'domains/user.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();


    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),

        ],
        child: MaterialApp(
       title: 'my flutter app login',
          home: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error:${snapshot.error}');
                  else

                  if (snapshot.data == null) {
                    return LoginPage();
                  } else {
                    UserPreferences().removeUser();
                  }
                  return Welcome();
              }
            },
          ),

        ),


    );

  }

}

