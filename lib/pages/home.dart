import 'package:flutter/material.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/provider/add_provider.dart';
import 'package:myflutter/provider/article_provider.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'login.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var article = Provider.of<ArtProvider>(context).list();
    final title = 'Liste d\'articles';



    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            /*ListTile(
              title: Text('${article.name}'),
            ),
            ListTile(
              title: Text('${article.description}'),
            ),
            ListTile(
              title: Text('${article.is_rate}'),
            ),
            ListTile(
              title: Text('${article.check_stored}'),
            ),
            ListTile(
              title: Text('${article.create_at}'),
            ),
            ListTile(
              title: Text('${article.update_at}'),
            ),*/
          ],
            )
           ),
        );
  }
}
