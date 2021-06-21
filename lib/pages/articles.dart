import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "Nexah billing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white

                        ),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Découvrez nos différents articles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,

                        ),
                      )
                    ],
                  ),
                ],
              ),)
        ),
      ),

    );
  }
}
