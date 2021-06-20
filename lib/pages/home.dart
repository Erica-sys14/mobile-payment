import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<Article> list;
  late List items = [];
  var _article;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = list;

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
      /*succesfulmessage.then((response) {
      Article _article = response;
      debugPrint("before value article " + _article.toString());
    });*/
      debugPrint("after value article " + _articles.toString());

      final title = 'Liste d\'articles';

      return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: FutureBuilder<Article>(
              future: _articles,
              builder: (context, snapshot) {
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
      );
    }
  }

// class HomePage extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     debugPrint("Test");
//
//
//
//
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView(
//           children: <Widget>[
//             /*ListTile(
//               title: Text('${article.name}'),
//             ),
//             ListTile(
//               title: Text('${article.description}'),
//             ),
//             ListTile(
//               title: Text('${article.is_rate}'),
//             ),
//             ListTile(
//               title: Text('${article.check_stored}'),
//             ),
//             ListTile(
//               title: Text('${article.create_at}'),
//             ),
//             ListTile(
//               title: Text('${article.update_at}'),
//             ),*/
//           ],
//             )
//            ),
//         );
//   }


}
