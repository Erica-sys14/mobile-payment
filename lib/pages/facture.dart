import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutter/pages/paiement.dart';

class ListFacture extends StatelessWidget {

    late List<String> facture = [
      'facture Bulk SMS',
      'facture Quick Search',
      'facture Game Factory',
      'facture Health First',
      'facture Todo',
    ] ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 65,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Mes factures',
            textAlign: TextAlign.center,
            style: GoogleFonts.mavenPro(textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            )
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paiement()),
                  );
                },
                icon: Icon(Icons.add, color: Colors.black, size: 20,))
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: facture.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 1.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white70),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                    title: Text(facture[index],
                      style: GoogleFonts.mavenPro(textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                      ),
                      ),
                    ),
                   /* facture[index],
                    style: */
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
