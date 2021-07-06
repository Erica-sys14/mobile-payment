import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/pages/menu.dart';
import 'package:myflutter/pages/new_articles.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:provider/provider.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  late Future<Article> list;
  late List items = [];
  var _provider;
  late Future<Article> _articles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*setState(() {
      items = _articles;
    });*/
    // _list = list();


  }


  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<ArticleProvider>(context);
    _articles = _provider.list();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,

          title: Text(
            'Mes articles',
            style: GoogleFonts.mavenPro(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => New_Articles()),
                  );
                },
                icon: (
                  Icon(Icons.add)
                ),
              iconSize: 25,
              color: Colors.black,
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: FutureBuilder<Article>(
              future: _articles,
                 builder: (context, snapshot) {
                   debugPrint('ok');
                   if (snapshot.hasData) {
                     return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.article.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                      elevation: 1.0,
                                      color: Colors.white,
                                      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                      child: Container(
                                          decoration: BoxDecoration(color: Colors.white70),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                                            title: Text(
                                              '${snapshot.data!.article[index]['name']}',
                                              style: GoogleFonts.mavenPro(textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              ),
                                            ),
                                            trailing:
                                            PopupMenuButton<int>(
                                                color: Colors.white,
                                                elevation: 10,
                                                onSelected: (items) => SelectItems(context, items, '${snapshot.data!.article[index]['id']}'),
                                                icon: Icon(Icons.more_vert, size: 25, color: Colors.grey,),
                                                itemBuilder: (context) => <PopupMenuEntry<int>>[
                                                  PopupMenuItem<int>(
                                                    value: 0,
                                                    child: Text('Supprimer',
                                                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      ),),
                                                  ),
                                                ]),


                                          )
                                      )
                                  );


                                  /*  Dismissible(
                        key: Key(snapshot.data!.article[index]['id'].toString()),
                        onDismissed: (DismissDirection direction){
                          setState(() {
                            snapshot.data!.article[index]['name'].removeAt(index);

                          });
                        },
                        child:

                       );*/
                                });
                     }
                   else if (snapshot.hasError) {
                     return Text("${snapshot.error}");
                   }

                   // By default, show a loading spinner.
                   return CircularProgressIndicator();
                        },
                      ),
                )
            ),
          )
    );
  }

  SelectItems(BuildContext context, int items, String article_id) {
    switch (items) {
      case 0:
        Delete(article_id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Articles()),
        );
        break;
    }
  }

  Delete(String article_id) {
      final Future<Map<String, dynamic>> art = _provider.clear(article_id);
      art.then((response){
        var reponse = response['status'];
        if (reponse){
          print("Article Supprimé");
          debugPrint(reponse.toString());
          return true;
        }
        else {
          print("Article Non Supprimé");
          debugPrint("false");
          return false;
        }

      });
  }
}

