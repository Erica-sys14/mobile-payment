import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:provider/provider.dart';


class Paiement extends StatefulWidget {
  const Paiement({Key? key}) : super(key: key);

  @override
  _PaiementState createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  final formKey = GlobalKey<FormState>();
  late Future<Article> _articles;
  late String _myArticles;
  late String _myArticlesResult;
  var _provider;
  late String price;
  late String quant;

  _saveForm() {
    var form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      setState(() {
        _myArticlesResult = _myArticles;
      });
    }

  }
   @override
  Widget build(BuildContext context) {
     _provider = Provider.of<ArticleProvider>(context);
     _articles = _provider.list();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // width: double.infinity,
          // height: MediaQuery
          //     .of(context)
          //     .size
          //     .height,
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Effectuer un nouveau paiement",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      DropDownFormField(
                                        titleText: ('Articles'),
                                        hintText: ('please choose one'),
                                        onSaved: (value) {
                                          setState(() {
                                            _myArticles = value;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _myArticles = value;
                                          });
                                        },
                                        dataSource: [_articles],
                                      ),
                                      SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "Pu_ht_custom",
                                                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.blueAccent),
                                                  ),
                                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                                ),
                                                validator: (value) {
                                                  if (value != null && value.isEmpty) {
                                                    return ' enter your pu_ht_custom';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (value) =>  price = value.toString(),
                                              ),),

                                              SizedBox(width: 20,),

                                              Expanded(
                                                child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "en",
                                                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.blueAccent),
                                                  ),
                                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                                ),
                                                validator: (value) {
                                                  if (value != null && value.isEmpty) {
                                                    return ' enter your pu_ht_custom';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (value) =>  quant = value.toString(),
                                              ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Expanded(
                                          child:Text(
                                              'Total: ',
                                           textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Total",
                                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.grey.shade300),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.blueAccent),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        ),
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return ' enter your pu_ht_custom';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) =>  quant = value.toString(),
                                      ),)
                                    ],
                                  ),
                                      SizedBox(height: 25,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {_saveForm();},
                                              child: Text('validate'),
                                            textColor: Colors.white,
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                          )
                                          )
                                        ],
                                      )

                                    ],
                                  )
                              )
                          )
                        /*Text(
                      "Payer par orange money ou momo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,

                      ),
                    )*/
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
