import 'package:flutter/material.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';

class QuizScreen1 extends StatelessWidget {
  const QuizScreen1({super.key});

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
          child: AppBar(
            title: const Text(
              'Εισαγωγικές Εξετάσεις Sierra Yankee',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Είδος Εξέτασης:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Επιλέξτε τον αριθμό τυχαίων ερωτήσεων:',
                  style: TextStyle(fontSize: 18, color: AppColors.textColor),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '030',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.middleGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Text(
                            '30',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.darkGrad,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '060',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.middleGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Text(
                            '60',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.darkGrad,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '090',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.middleGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Text(
                            '90',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.darkGrad,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Ή εναλλακτικά,',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Επιλέξτε την κατηγορία ερωτήσεων:',
                  style: TextStyle(fontSize: 18, color: AppColors.textColor),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '0Α',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.darkGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Α'",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(210, 255, 255, 255),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                ' - Τεχνικά Θέματα',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '0Β',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.darkGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Β'",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(210, 255, 255, 255),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                ' - Λειτουργικά Θέματα',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '0Γ',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.darkGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Γ'",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(210, 255, 255, 255),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                ' - Νομικά Θέματα',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: '0Δ',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.darkGrad,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Δ'",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(210, 255, 255, 255),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                ' - Πρακτικά Θέματα',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Για προσομοίωση εξέτασης,',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Επιλέξτε εδώ.',
                  style: TextStyle(fontSize: 18, color: AppColors.textColor),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/quiz',
                          arguments: '0ΠΕ',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: AppColors.darkerGrad,
                        shadowColor: const Color(0xFFaaaaaa),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Εξέταση  ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(200, 255, 255, 255),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Sierra Yankee",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(210, 255, 255, 255),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
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
