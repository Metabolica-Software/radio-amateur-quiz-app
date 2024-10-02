import 'package:flutter/material.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';

class Alphabet extends StatelessWidget {
  const Alphabet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            child: Semantics(
              label: 'Φωνητικά Αλφάβητα',
              child: AppBar(
                title: const Text(
                  'Φωνητικά Αλφάβητα',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                centerTitle: true,
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
                flexibleSpace: Container(
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Semantics(
              label: 'Περιέχει το Ελληνικό και το Διεθνές Φωνητικό αλφάβητο.',
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Ελληνικό Φωνητικό\nΑλφάβητο',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'AkaAcidSciFly',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Διεθνές Φωνητικό\nΑλφάβητο',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'AkaAcidSciFly',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text(
                        'Α\nΒ\nΓ\nΔ\nΕ\nΖ\nΗ\nΘ\nΙ\nΚ\nΛ\nΜ\nΝ\nΞ\nΟ\nΠ\nΡ\nΣ\nΤ\nΥ\nΦ\nΧ\nΨ\nΩ',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.45,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        'Αστήρ\nΒύρων\nΓαλή\nΔόξα\nΕρμής\nΖεύς\nΗρώ\nΘεά\nΊσκιος\nΚενόν\nΛάμα\nΜέλι\nΝαός\nΞέρξης\nΟσμή\nΠέτρος\nΡήγας\nΣοφός\nΤίγρης\nΎμνος\nΦωφώ\nΧαρά\nΨυχή\nΩμέγα',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.45,
                        ),
                      ),
                      Text(''),
                      Text(
                        'A\nB\nC\nD\nE\nF\nG\nH\nI\nJ\nK\nL\nM\nN\nO\nP\nQ\nR\nS\nT\nU\nV\nW\nX\nY\nZ',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.45,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        'Alfa\nBravo\nCharlie\nDelta\nEcho\nFoxtrot\nGolf\nHotel\nIndia\nJuliet\nKilo\nLima\nMike\nNovember\nOscar\nPapa\nQuebec\nRomeo\nSierra\nTango\nUniform\nVictor\nWhiskey\nX-ray\nYankee\nZulu',
                        style: TextStyle(
                          color: Color.fromARGB(200, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.45,
                        ),
                      ),
                      Text(''),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
