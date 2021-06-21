import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myflutter/pages/articles.dart';
import 'package:myflutter/utility/widgets.dart';

class New_Articles extends StatefulWidget {

  @override
  _New_ArticlesState createState() => _New_ArticlesState();
}

class _New_ArticlesState extends State<New_Articles> {
  final formKey = GlobalKey<FormState>();

  late String _name, _details, _price, _puht, _puthcust;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Articles()),
              );
            },
            icon: Icon(Icons.arrow_back, color: Colors.black87, size: 25,)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),

          child: Form(
            key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Text("Create Account,", textAlign: TextAlign.center, style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("Sign up to get started!", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,color: Colors.grey.shade400),),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: <Widget>[

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Price",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Details",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PU_HT",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PU_HT_Custom",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: (){},
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff),
                              Color(0xffff5f6d),
                              Color(0xffffc371),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                          child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
  }




