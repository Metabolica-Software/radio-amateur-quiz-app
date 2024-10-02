import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Links extends StatelessWidget {
  const Links({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

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
              label: 'Χρήσιμοι Σύνδεσμοι',
              child: AppBar(
                title: const Text(
                  'Χρήσιμοι Σύνδεσμοι',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                centerTitle: true,
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Semantics(
                      label: 'Συμμετοχή σε Εξετάσεις',
                      hint:
                          'Ανοίγει έναν σύνδεσμο που οδηγεί σε συμμετοχή για εξετάσεις.',
                      child: ElevatedButton(
                        onPressed: () => _launchURL(
                            'https://www.gov.gr/regions/periphereia-boreiou-aigaiou/periphereia-boreiou-aigaiou/summetokhe-se-exetaseis-gia-apoktese-ptukhiou-radioerasitekhne'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: const Color(0xFF003476),
                          shadowColor: const Color(0xFFaaaaaa),
                        ),
                        child: const AutoSizeText(
                          'Συμμετοχή σε Εξετάσεις',
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.buttonTextColor,
                          ),
                          maxLines: 1,
                          minFontSize: 17,
                        ),
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
                    label: 'Ερωτηματολόγιο Sierra Yankee',
                    hint:
                        'Ανοίγει έναν σύνδεσμο που οδηγεί στην λήψη φακέλου με το ερωτηματολόγιο εισαγωγικού επιπέδου Sierra Yankee.',
                    child: ElevatedButton(
                      onPressed: () => _launchURL(
                          'https://raag.org/wp-content/uploads/2020/11/ΚΑΤΗΓΟΡΙΑ-ΕΙΣΑΓΩΓΙΚΟΥ-ΕΠΙΠΕ∆ΟΥ.pdf'),
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
                          AutoSizeText(
                            'Ερωτηματολόγιο ',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.buttonTextColor,
                            ),
                            maxLines: 1,
                            minFontSize: 17,
                          ),
                          AutoSizeText(
                            'SY',
                            style: TextStyle(
                              fontSize: 28,
                              color: AppColors.buttonTextColor,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'AkaAcidSciFly',
                            ),
                            maxLines: 1,
                            minFontSize: 23,
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
                    label: 'Ερωτηματολόγιο Sierra Victor',
                    hint:
                        'Ανοίγει έναν σύνδεσμο που οδηγεί στην λήψη φακέλου με το επιπέδου 1 Sierra Victor.',
                    child: ElevatedButton(
                      onPressed: () => _launchURL(
                          'https://raag.org/wp-content/uploads/2020/11/ΚΑΤΗΓΟΡΙΑ-1.pdf'),
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
                          AutoSizeText(
                            'Ερωτηματολόγιο ',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.buttonTextColor,
                            ),
                            maxLines: 1,
                            minFontSize: 17,
                          ),
                          AutoSizeText(
                            'SV',
                            style: TextStyle(
                              fontSize: 28,
                              color: AppColors.buttonTextColor,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'AkaAcidSciFly',
                            ),
                            maxLines: 1,
                            minFontSize: 23,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Semantics(
                      label: 'Ένωση Ραδιοερασιτέχνων',
                      hint:
                          'Ανοίγει έναν σύνδεσμο που οδηγεί στην ιστοσελίδα ένωσης ραδιοερασιτέχνων.',
                      child: ElevatedButton(
                        onPressed: () => _launchURL('https://raag.org/'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: const Color(0xFF003476),
                          shadowColor: const Color(0xFFaaaaaa),
                        ),
                        child: const AutoSizeText(
                          'Ένωση Ραδιοερασιτέχνων',
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.buttonTextColor,
                          ),
                          maxLines: 1,
                          minFontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
