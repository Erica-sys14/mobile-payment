import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/pages/login.dart';
import 'package:myflutter/providers/user_provider.dart';
import 'package:myflutter/util/share_preference.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD PAGE"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(child: Text('${user.email}')),
          SizedBox(height: 100),
          RaisedButton(
            onPressed: () {
              UserPreferences().removeUser();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Logout"),
            color: Colors.lightBlueAccent,
          )
        ],
      ),
    );  }
}

