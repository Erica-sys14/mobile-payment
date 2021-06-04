import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/providers/auth_provider.dart';
import 'package:myflutter/pages/home.dart';
import 'package:myflutter/utility/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  @override
_LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);


    var doLogin = () {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
        auth.login(_email, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
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


      return SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,),


          ),
        ),

        body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Login",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Login to your account",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700]
                    ),)
                ],
              ),

              SizedBox(height: 15.0,),
              Text('Email'),
              SizedBox(height: 5.0,),
              TextFormField(
                autofocus: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value.toString(),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 20,
                    minWidth: 20,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20.0,),
              Text('Password'),
              SizedBox(height: 5.0,),
              TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value.toString(),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 20,
                    minWidth: 20,
                  ),
                  border: OutlineInputBorder(),
                ),

              ),

              SizedBox(height: 20.0,),
              auth.loggedInStatus == Status.Authenticating
                  ?loading
                  : longButtons('Login',doLogin),
              SizedBox(height: 8.0,),
              Container(
                padding: EdgeInsets.only(bottom: 100),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bord2.png"),
                      fit: BoxFit.fitHeight
                  ),
                ),
              ),


            ],
          ),
          ),
        ),
        ),
        ),
      );
    }

    // ignore: non_constant_identifier_names

  }

