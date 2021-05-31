import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),

      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      InputFile(label: "Email"),
                      InputFile(label: "Password", obscureText: true)

                  ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot password", style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 10,
                        color: Colors.blue),)
                      ],
                    ),
                ),
                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                    padding: EdgeInsets.only(top: 30, left: 3),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {

                      },
                      color: Color(0xff25a9e5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bord2.png"),
                        fit: BoxFit.fitHeight
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  Widget InputFile({label, obscureText = false})
  {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
             label,
         style: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.w600,
           color: Colors.black,
         ),

         ),
         SizedBox(
           height: 3,
         ),
         TextField(
           obscureText: obscureText,
           decoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(vertical: 0,
             horizontal: 10),
             enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(
             color: Colors.grey
             ),

             ),
             border: OutlineInputBorder(
               borderSide: BorderSide(
                   color: Colors.grey)
             )
           ),
         ),
         SizedBox(height: 10,),
       ],
     );
  }
}




