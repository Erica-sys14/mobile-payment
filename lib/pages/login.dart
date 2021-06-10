import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myflutter/domains/user.dart';
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




   final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Login ... Please wait")
      ],
    );



    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 15.0),
                Text('Email'),
                SizedBox(height: 5.0),
                TextFormField(
                  autofocus: false,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Your username is required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => _userName = value.toString(),
                  decoration: buildInputDecoration('Enter email', Icons.email),
                ),
                SizedBox(height: 20.0),
                Text('Password'),
                SizedBox(height: 5.0),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Your password is required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => _password = value.toString(),
                  decoration: buildInputDecoration('Enter password', Icons.lock),
                ),
                SizedBox(height: 50.0,),

                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: doLogin(){
                    final form = formKey.currentState;
                    if (form != null && form.validate()) {
                    form.save();

                    final Future<Map<String, dynamic>> successfulMessage =
                    auth.login(_userName, _password);

                    successfulMessage.then((response) {
                    if (response['status']) {
                    User user = response['user'];
                    Provider.of<UserProvider>(context, listen: false).setUser(user);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    } else {
                    Flushbar(
                    title: "Failed Login",
                    message: 'Please complete the form properly',
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
                    });
                    } ,
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
      ),
    );
  }
}
