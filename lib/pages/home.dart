import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/shared_preferences.dart';
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
        title: Text("Home"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: Text(user.email)),
          SizedBox(height: 100),
          MaterialButton(
            onPressed: (){},
            child: Text("Logout"),
            color: Colors.blue,)
        ],
      ),
    );
  }
}

