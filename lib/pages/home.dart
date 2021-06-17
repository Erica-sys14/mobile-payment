import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/provider/add_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   late List items = [];
   var _article;

   @override
   void initState() {
     // TODO: implement initState
     super.initState();

   }


  @override
  Widget build(BuildContext context) {
    final Future<Map<String, dynamic>> succesfulmessage = Provider.of<ArtProvider>(context).list();
    succesfulmessage.then((response) {
        setState(() { _article = response['data']['data']; });
        debugPrint("before value article " + _article.toString());
    });
    debugPrint("after value article " + _article.toString());

    final title = 'Liste d\'articles';

    return MaterialApp(
        title: title,
       home: Scaffold(
         appBar: AppBar(
          title: Text(title),
       ),
        body: ListView.builder(
            itemCount: items.length,
          itemBuilder: (context, index) {

            return ListTile(
              title: Text(_article[index])
            );

          },
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
// }
