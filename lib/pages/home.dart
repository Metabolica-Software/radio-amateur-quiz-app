import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_test_4/pages/links.dart';
import 'package:radio_test_4/pages/saved.dart';
import './qs1.dart';
import './qs2.dart';
import './alphabet.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bottomBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Semantics(
                label: 'Διαλέξτε το επίπεδο εξέτασης:',
                child: const Text(
                  'Διαλέξτε το επίπεδο εξέτασης:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Semantics(
                    label: 'Εξετάσεις Εισαγωγικού Επιπέδου Sierra Yankee',
                    hint: 'Ανοίγει την οθόνη επιλογής εξέτασης.',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizScreen1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: AppColors.buttonColor,
                        shadowColor: const Color(0xFFaaaaaa),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Εξετάσεις Επιπέδου  ',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.buttonTextColor,
                            ),
                          ),
                          Text(
                            'SY',
                            style: TextStyle(
                              fontSize: 28,
                              color: AppColors.buttonTextColor,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'AkaAcidSciFly',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Semantics(
                    label: 'Εξετάσεις Επιπέδου 1 Sierra Victor',
                    hint: 'Ανοίγει την οθόνη επιλογής εξέτασης.',
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizScreen2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: AppColors.buttonColor,
                        shadowColor: const Color(0xFFaaaaaa),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Εξετάσεις Επιπέδου  ',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.buttonTextColor,
                            ),
                          ),
                          Text(
                            'SV',
                            style: TextStyle(
                              fontSize: 28,
                              color: AppColors.buttonTextColor,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'AkaAcidSciFly',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.bottomBarColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Semantics(
                  label: 'Αποθηκευμένες Ερωτήσεις',
                  hint: 'Ανοίγει την οθόνη με τις αποθηκευμένες ερωτήσεις.',
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Saved()),
                      );
                    },
                    icon: const Icon(
                      Icons.save,
                      size: 40,
                    ),
                    color: AppColors.bottomBarButtonColor,
                  ),
                ),
                Semantics(
                  label: 'Χρήσιμοι Σύνδεσμοι',
                  hint: 'Ανοίγει την οθόνη με τους χρήσιμους συνδέσμους.',
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Links()),
                      );
                    },
                    icon: const Icon(
                      Icons.info,
                      size: 40,
                    ),
                    color: AppColors.bottomBarButtonColor,
                  ),
                ),
                Semantics(
                  label: 'Φωνητικό Αλφάβητο',
                  hint: 'Ανοίγει την οθόνη που περιέχει το φωνητικό αλφάβητο.',
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Alphabet()),
                      );
                    },
                    icon: const Icon(
                      Icons.fact_check,
                      size: 40,
                    ),
                    color: AppColors.bottomBarButtonColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSize appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFaaaaaa).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Semantics(
        label: 'Ραδιοερασιτεχνία',
        child: AppBar(
          title: const Text(
            '\nΡΑΔΙΟΕΡΑΣΙΤΕΧΝΙΑ',
            style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.7,
              fontFamily: 'AkaAcidSciFly',
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      ),
    ),
  );
}
