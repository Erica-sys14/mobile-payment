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
  final List<Article> items = [];
  var userData;

  @override
  Widget build(BuildContext context) {
    debugPrint(this.userData);
    this.userData = Provider.of<ArtProvider>(context).list();
    debugPrint(Provider.of<ArtProvider>(context).list().toString());
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
              title: Text(userData),
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
