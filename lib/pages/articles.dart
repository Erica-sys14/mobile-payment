import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myflutter/domains/article.dart';
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
  var _article;
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
    _articles = Provider.of<ArticleProvider>(context).list();

    debugPrint(_articles.toString());
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: .0,
          backgroundColor: Colors.white,
          actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => New_Articles()),
              );
            },
            icon: Icon(Icons.add, color: Colors.black, size: 25,),
          ),
          ],
        ),
        body:
        Center(
          child: FutureBuilder<Article>(
            future: _articles,
            builder: (context, snapshot) {
              debugPrint('ok');
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.article.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            '${snapshot.data!.article[index]['name']}'),
                      );
                    });
              }
              else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );  }
}



