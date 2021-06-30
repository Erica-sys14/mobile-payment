import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/pages/menu.dart';
import 'package:myflutter/provider/auth_provider.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/widgets.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  late String _userName, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);


    var doLogin = () {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = auth.login(_userName, _password);
        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuNavbar()),
            );
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['data']['user'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }

        });
      } else{
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }

    };

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Login ... Please wait")
      ],
    );



    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40,),
            child: Center(
          child: Form(
            key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 40,),
                  Text('Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Welcome Back",
                    textAlign: TextAlign.center,
                    style: TextStyle( fontFamily: 'Montserrat',
                        fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Login with your email and password \n or continue with Nexah Billing",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700]
                    ),)
                ],
              ),

              SizedBox(height: 30.0,),
              TextFormField(
                autofocus: false,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _userName = value.toString(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 15),
                 /* prefix: Icon(Icons.email_outlined, size: 24,),*/
                  labelText: "Pu_ht_custom",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey[700],fontWeight: FontWeight.w600),
                  suffixIcon: Icon(Icons.email_outlined, size: 20,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                ),

              SizedBox(height: 20.0,),
              TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value.toString(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 15),
                    labelText: "Pu_ht_custom",
                    labelStyle: TextStyle(fontSize: 14,color: Colors.grey[700],fontWeight: FontWeight.w600),
                    suffixIcon: Icon(Icons.lock_outline, size: 20,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),

              ),

              SizedBox(height: 40.0,),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {doLogin();},
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
              ),
               ]
                ),
                    ),


                )

            )
          ),
        );

  }
}
