import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          // height: MediaQuery.of(context).size.height,n
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 40),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Dashboard',
                        style: GoogleFonts.mavenPro(textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          height: 1
                        ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Welcome to nexah ${user.first_name}',
                          style: GoogleFonts.mavenPro(textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              height: 1,
                              color: Colors.black38
                          ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Thank you to join our mobile payment platform",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mavenPro(textStyle: TextStyle(
                      fontSize: 15,
                    ),
                    ),
                  ),
                ],
              ),
          )

        ),
      ),

    );

  }
}
