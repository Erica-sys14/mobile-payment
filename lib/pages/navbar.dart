import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/pages/articles.dart';
import 'package:myflutter/pages/paiement.dart';
import 'package:myflutter/pages/profile.dart';

import 'dashboard.dart';


class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Dashboard _dashboard = Dashboard();
    final Articles _articlee = Articles();
    final Paiement _paiement = Paiement();
    final Profil _profil = Profil();

    int selectedIndex = 0;
    final _bgColor = Color(0xFFF6F6F6);

    Widget _showPage = new Dashboard();

    Widget _pageChooser(int page){
      switch (page) {
        case 0:
          return _dashboard;
          break;
        case 1:
          return _articlee;
          break;
        case 2:
          return _paiement;
          break;
        case 3:
          return _profil;
          break;
        default:
          return new Container(
              child: new Text('No page found by page chooser',
                style: new TextStyle(fontSize: 30),)
          );
      }
    }

    return Scaffold(
      body: Container(
      color: _bgColor,
    child: Center(
    child: _showPage,
    )
    ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.home_outlined,
          Icons.shopping_basket_outlined,
          Icons.credit_card_outlined,
          Icons.account_circle_outlined,
          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.home,
          Icons.shopping_basket,
          Icons.credit_card,
          Icons.account_circle,
          // Icons.settings,
        ],
        onTapped: (int tappedIndex) {
            _showPage = _pageChooser(tappedIndex);
        },
        bodyBgColor: _bgColor,
        highlightColor: Colors.blue,
        navFgColor: Colors.grey.withOpacity(0.5),
        navBgColor: Colors.white,
      ),
    );
  }
}
