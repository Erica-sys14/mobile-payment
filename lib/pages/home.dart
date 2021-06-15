import 'package:flutter/material.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/provider/user_provider.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'login.dart';

class HomePage extends StatelessWidget {


  final items = List<String>.generate(10000, (i) => 'Items $i');

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
