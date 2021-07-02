import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Mes factures',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
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
          itemCount: facture.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(bottom: 16.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Text(
                    facture[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.6
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
