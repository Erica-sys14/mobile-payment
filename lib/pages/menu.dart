import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/pages/articles.dart';
import 'package:myflutter/pages/dashboard.dart';
import 'package:myflutter/pages/paiement.dart';
import 'package:myflutter/pages/profile.dart';


class MenuNavbar extends StatefulWidget {
  const MenuNavbar({Key? key}) : super(key: key);

  @override
  _MenuNavbarState createState() => _MenuNavbarState();
}

class _MenuNavbarState extends State<MenuNavbar> {
  int pageIndex = 0;

  final Dashboard _dashboard = Dashboard();
  final Articles _article = Articles();
  final Paiement _paiement = Paiement();
  final Profil _profil = Profil();

  Widget _showPage = new Dashboard();

  Widget _pageChooser(int page){
    switch (page) {
      case 0:
        return _dashboard;
        break;
      case 1:
        return _article;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        items: <Widget>[
          Icon(Icons.dashboard_customize_outlined, size: 25,color: Colors.white,),
          Icon(Icons.shopping_bag_outlined, size: 25,color: Colors.white,),
          Icon(Icons.credit_card, size: 25,color: Colors.white,),
          Icon(Icons.perm_identity_outlined, size: 25,color: Colors.white,)
        ],
        color: Colors.lightBlue,
        buttonBackgroundColor: Colors.lightBlue,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          // child: Text(_page.toString(), textScaleFactor: 10.0,),
          child: _showPage,
        ),
      ),
    );
  }
}
