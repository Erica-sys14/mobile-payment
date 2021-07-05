

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Profil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
            'Profil',
            style: GoogleFonts.mavenPro(
              textStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),)
        ),
      ),

      body: SafeArea(
        child: Center(
          // width: double.infinity,
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.account_circle_outlined, size: 100, color: Colors.black45,),
                    Text(
                      'Hi ${user.first_name} ${user.last_name}!!!',
                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                      )

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${user.email}',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      )
                    ),
                    SizedBox(height: 20,),
                    Text(
                        'Phone Number',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '${user.telephone}',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      ),
                    ),
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
