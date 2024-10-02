import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/questions.dart';
import 'results.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';
import '../models/savemanager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  int _currentQuestion = 0;
  List<Question> _incorrectQuestions = [];
  List<Question> _selectedQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_selectedQuestions.isEmpty) {
      _initializeQuestions();
    }
  }

  Future<void> _showExitDialog() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.buttonColor,
        title: const Text(
          'Τερματισμός Εξέτασης',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.bottomBarButtonColor,
          ),
        ),
        content: const Text(
          'Είστε σίγουροι;',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.backgroundColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Ακύρωση',
              style: TextStyle(color: AppColors.buttonTextColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
            },
            child: const Text(
              'Ναι',
              style: TextStyle(color: AppColors.buttonTextColor),
            ),
          ),
        ],
      ),
    );
    if (shouldExit ?? false) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }

  void _initializeQuestions() async {
    if (_selectedQuestions.isNotEmpty) return;
    final Object? arguments = ModalRoute.of(context)!.settings.arguments;
    final String quizType = arguments is String ? arguments : 'Invalid Type';

    List<Question> filteredQuestions = [];
    List<Question> c0Questions = [];
    List<Question> c1Questions = [];
    List<Question> c2Questions = [];
    List<Question> c3Questions = [];
    int numberOfQuestions = 0;

    if (quizType == '030') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 30;
    } else if (quizType == '060') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 60;
    } else if (quizType == '090') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 90;
    } else if (quizType == '0Α') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 0 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '0Β') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 1 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '0Γ') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 2 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '0Δ') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 3 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '0ΠΕ') {
      c0Questions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 0 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      c1Questions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 1 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      c2Questions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 2 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      c3Questions = questions.values.where((question) {
        return (question.level == 0 || question.level == 2) &&
            question.category == 3 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      List<Question> selectedC0Questions =
          (c0Questions..shuffle()).take(20).toList();
      List<Question> selectedC1Questions =
          (c1Questions..shuffle()).take(20).toList();
      List<Question> selectedC2Questions =
          (c2Questions..shuffle()).take(20).toList();
      List<Question> selectedC3Questions =
          (c3Questions..shuffle()).take(40).toList();
      filteredQuestions = [
        ...selectedC0Questions,
        ...selectedC1Questions,
        ...selectedC2Questions,
        ...selectedC3Questions,
      ];
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '1120') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 120;
    } else if (quizType == '1150') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 150;
    } else if (quizType == '1180') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 180;
    } else if (quizType == '1Α') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 0 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = 180;
    } else if (quizType == '1Β') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 1 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '1Γ') {
      filteredQuestions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 2 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == '1ΠΕ') {
      c0Questions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 0 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      c1Questions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 1 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      c2Questions = questions.values.where((question) {
        return (question.level == 1 || question.level == 2) &&
            question.category == 2 &&
            question.questionTitle.isNotEmpty;
      }).toList();
      List<Question> selectedC0Questions =
          (c0Questions..shuffle()).take(50).toList();
      List<Question> selectedC1Questions =
          (c1Questions..shuffle()).take(30).toList();
      List<Question> selectedC2Questions =
          (c2Questions..shuffle()).take(20).toList();
      filteredQuestions = [
        ...selectedC0Questions,
        ...selectedC1Questions,
        ...selectedC2Questions,
      ];
      numberOfQuestions = filteredQuestions.length;
    } else if (quizType == 'ΑΕ') {
      final saveManager = SaveManager();
      final savedQuestions = await saveManager.loadSavedQuestions();
      filteredQuestions = savedQuestions;
      numberOfQuestions = filteredQuestions.length;
    }

    setState(() {
      _selectedQuestions =
          (filteredQuestions..shuffle()).take(numberOfQuestions).toList();
    });

    //print('Selected Questions:');
    //for (var question in _selectedQuestions) {
    //  print('Question Level: ${question.level}');
    //  print('Category: ${question.category}');
    //}
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestion < _selectedQuestions.length - 1) {
        _currentQuestion++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              incorrectQuestions: _incorrectQuestions,
              totalQuestions: _selectedQuestions.length,
            ),
          ),
        );
        //_selectedQuestions = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ΚΟΥΪΖ',
            style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.7,
              fontFamily: 'AkaAcidSciFly',
            ),
          ),
          backgroundColor: const Color(0xFFf1f1f1),
        ),
        body: const Center(child: Text('Σφάλμα.')),
      );
    }

    final currentQuestion = _selectedQuestions[_currentQuestion];
    final validOptions =
        currentQuestion.options.where((option) => option.isNotEmpty).toList();
    double progress = (_currentQuestion + 1) / _selectedQuestions.length;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bottomBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.bottomBarColor,
        appBar: AppBar(
          backgroundColor: AppColors.bottomBarColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'ΚΟΥΪΖ',
            style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.7,
              fontFamily: 'AkaAcidSciFly',
            ),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: AppColors.bottomBarColor,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(15),
                value: progress,
                backgroundColor: AppColors.bottomBarButtonColor,
                color: AppColors.darkerGrad,
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            _showExitDialog();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentQuestion.icon.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        currentQuestion.icon,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: AutoSizeText(
                      currentQuestion.questionTitle,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontFamily: 'Attractive'),
                      textAlign: TextAlign.center,
                      maxLines: 7,
                      minFontSize: 15,
                    ),
                  ),
                  const Divider(
                    height: 40,
                    thickness: 2,
                    color: Color.fromARGB(150, 0, 0, 0),
                    indent: 10,
                    endIndent: 10,
                  ),
                  ...validOptions.map((option) {
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            if (option ==
                                currentQuestion
                                    .options[currentQuestion.correctAnswer]) {
                              _nextQuestion();
                            } else {
                              setState(() {
                                _incorrectQuestions.add(currentQuestion);
                              });
                              _nextQuestion();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.bottomBarButtonColor,
                            shadowColor: const Color(0xFFaaaaaa),
                          ),
                          child: AutoSizeText(
                            option,
                            style: const TextStyle(
                              fontSize: 17,
                              color: AppColors.bottomBarColor,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 4,
                            minFontSize: 9,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  //const SizedBox(height: 20),
                  //ElevatedButton(
                  //  onPressed: _nextQuestion,
                  //  child: const Text('Next Question'),
                  //  style: ElevatedButton.styleFrom(
                  //    shape: RoundedRectangleBorder(
                  //      borderRadius: BorderRadius.circular(10),
                  //    ),
                  //    backgroundColor: const Color(0xFF9addbd),
                  //  ),
                  //),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _isAdLoaded
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: _bannerAd.size.height.toDouble(),
                  width: _bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              )
            : null,
      ),
    );
  }
}
