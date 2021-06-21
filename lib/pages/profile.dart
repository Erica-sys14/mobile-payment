import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Center(
          // width: double.infinity,
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,


                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hi Erica-sys14",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
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
