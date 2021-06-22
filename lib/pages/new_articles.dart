import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myflutter/pages/articles.dart';
import 'package:myflutter/pages/menu.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/utility/widgets.dart';
import 'package:provider/provider.dart';

class New_Articles extends StatefulWidget {

  @override
  _New_ArticlesState createState() => _New_ArticlesState();
}

class _New_ArticlesState extends State<New_Articles> {
  final formKey = GlobalKey<FormState>();

  late String _name, _details, _is_rate, _check_stored, _pu_ht, _pu_th_custom;


  @override
  Widget build(BuildContext context) {
   ArticleProvider add = Provider.of<ArticleProvider>(context);

    var doSave = () {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> art = add.create(_name, _details, _is_rate, _check_stored, _pu_ht,_pu_th_custom);
        art.then((response){

          if (response['status']){
            debugPrint('true');
            return true;
          }
          else {
            debugPrint('false');
            return false;
          }

        });
        debugPrint(art.toString());
      }

    };



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),

          child: Form(
            key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value.toString(),

                    ),
                    SizedBox(height: 16,),
                    TextFormField(
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your detail';
                        }
                        return null;
                      },
                      onSaved: (value) => _details = value.toString(),
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Is_rate",
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your is_rate';
                        }
                        return null;
                      },
                      onSaved: (value) => _is_rate = value.toString(),
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Check_stored",
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your check_stored';
                        }
                        return null;
                      },
                      onSaved: (value) => _check_stored = value.toString(),
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pu_ht",
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your pu_ht';
                        }
                        return null;
                      },
                      onSaved: (value) => _pu_ht = value.toString(),
                    ),SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pu_ht_custom",
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return ' enter your pu_ht_custom';
                        }
                        return null;
                      },
                      onSaved: (value) => _pu_th_custom = value.toString(),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      child: FlatButton(
                        onPressed: (){
                          doSave();
                        },
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
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
                    SizedBox(height: 30,)
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    )
    );
  }
  }




