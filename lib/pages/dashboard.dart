import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold (
      body: SafeArea(
        child: Center(
          // width: double.infinity,
          // height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Welcome to nexah ${user.first_name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,


                        ),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Thank you to join our mobile payment platform",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,

                        ),
                      )
                    ],
                  ),
                ],
              ),
          )

        ),
      ),

    );

  }
}
