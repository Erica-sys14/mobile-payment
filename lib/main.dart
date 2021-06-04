import 'package:flutter/material.dart';
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
                  return Scaffold (
                    body: SafeArea(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,

                                  ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Billing Mobile App from Nexah",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 15,

                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/bord3.png"),
                                      fit: BoxFit.fitHeight
                                  )
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
//Define the shape
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  );
              }
            },
          ),

        ),


    );

  }

}

