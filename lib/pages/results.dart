import 'package:flutter/material.dart';
import '../models/questions.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';
import '../models/savemanager.dart';

class ResultsScreen extends StatefulWidget {
  final List<Question> incorrectQuestions;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.incorrectQuestions,
    required this.totalQuestions,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final SaveManager _saveManager = SaveManager();

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers =
        widget.totalQuestions - widget.incorrectQuestions.length;
    double percentage = (correctAnswers / widget.totalQuestions) * 100;
    int incorrectAnswers = widget.incorrectQuestions.length;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bottomBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          appBar: customAppBar(context),
          body: Container(
            color: AppColors.bottomBarColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Συνολικές Ερωτήσεις: ${widget.totalQuestions}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontFamily: 'Attractive',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Σωστές Απαντήσεις: $correctAnswers',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontFamily: 'Attractive',
                  ),
                ),
                Text(
                  'Λανθασμένες Απαντήσεις: $incorrectAnswers',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontFamily: 'Attractive',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ποσοστό Επιτυχίας: ${percentage.toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontFamily: 'Attractive',
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: Color.fromARGB(150, 0, 0, 0),
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: widget.incorrectQuestions.isNotEmpty
                      ? ListView.builder(
                          itemCount: widget.incorrectQuestions.length,
                          itemBuilder: (context, index) {
                            final question = widget.incorrectQuestions[index];
                            final validOptions = question.options
                                .where((option) => option.isNotEmpty)
                                .toList();

                            return FutureBuilder<bool>(
                              future: _saveManager.isQuestionSaved(question),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }

                                final isSaved = snapshot.data!;

                                return Card(
                                  color: AppColors.bottomBarButtonColor,
                                  elevation: 3,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      question.questionTitle,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .bottomBarColor,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.save),
                                                    color: isSaved
                                                        ? Color.fromARGB(
                                                            255, 28, 129, 211)
                                                        : AppColors
                                                            .bottomBarColor,
                                                    onPressed: () async {
                                                      if (isSaved) {
                                                        await _saveManager
                                                            .unsaveQuestion(
                                                                question);
                                                      } else {
                                                        await _saveManager
                                                            .saveQuestion(
                                                                question);
                                                      }
                                                      setState(() {});
                                                    },
                                                    tooltip:
                                                        'Αποθήκευση Ερώτησης',
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              ...validOptions
                                                  .asMap()
                                                  .entries
                                                  .map(
                                                (entry) {
                                                  int idx = entry.key;
                                                  String option = entry.value;
                                                  bool isCorrect = idx ==
                                                      question.correctAnswer;
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 4.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          isCorrect
                                                              ? Icons
                                                                  .check_circle
                                                              : Icons.cancel,
                                                          color: isCorrect
                                                              ? Colors.green
                                                              : Colors.red,
                                                          size: 20,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Expanded(
                                                          child: Text(
                                                            option,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              color: AppColors
                                                                  .bottomBarColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            'Συγχαρητήρια, όλες οι απαντήσεις είναι σωστές.',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(150, 0, 0, 0),
                              fontFamily: 'Attractive',
                            ),
                            textAlign: TextAlign.center,
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

AppBar customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.bottomBarColor,
    leading: IconButton(
      icon: const Icon(Icons.home),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      },
    ),
    title: const Text(
      'ΑΠΟΤΕΛΕΣΜΑΤΑ',
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
    flexibleSpace: Container(
      color: AppColors.bottomBarColor,
    ),
    toolbarHeight: 80,
  );
}
