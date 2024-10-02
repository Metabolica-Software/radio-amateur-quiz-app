import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/colors.dart';
import 'package:flutter/services.dart';
import '../models/savemanager.dart';
import '../models/questions.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  late Future<List<Question>> _savedQuestionsFuture;
  final SaveManager _saveManager = SaveManager();

  @override
  void initState() {
    super.initState();
    _savedQuestionsFuture = _loadSavedQuestions();
  }

  Future<List<Question>> _loadSavedQuestions() async {
    final path = await _saveManager.getFilePath();
    final file = File(path);

    if (await file.exists()) {
      final contents = await file.readAsString();
      final List<dynamic> jsonList = json.decode(contents);
      return jsonList.map((json) => Question.fromJson(json)).toList();
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bottomBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            child: Semantics(
              label: 'Αποθηκευμένες Ερωτήσεις',
              child: AppBar(
                title: const Text(
                  'Αποθηκευμένες Ερωτήσεις',
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
        body: FutureBuilder<List<Question>>(
          future: _savedQuestionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Semantics(
                label: 'Σφάλμα στην φόρτωση αποθηκευμένων ερωτήσεων.',
                child:
                    const Text('Σφάλμα στην φόρτωση αποθηκευμένων ερωτήσεων'),
              ));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Semantics(
                label: 'Δεν έχετε αποθηκευμένες ερωτήσεις.',
                child: const Text('Δεν έχετε αποθηκευμένες ερωτήσεις.'),
              ));
            }

            final savedQuestions = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: savedQuestions.length,
                itemBuilder: (context, index) {
                  final question = savedQuestions[index];
                  final validOptions = question.options
                      .where((option) => option.isNotEmpty)
                      .toList();

                  return Card(
                    color: AppColors.bottomBarButtonColor,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  question.questionTitle,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.bottomBarColor,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: AppColors.bottomBarColor,
                                onPressed: () async {
                                  await _saveManager.unsaveQuestion(question);
                                  setState(() {
                                    _savedQuestionsFuture =
                                        _loadSavedQuestions();
                                  });
                                },
                                tooltip: 'Remove Question',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ...validOptions.asMap().entries.map((entry) {
                            int idx = entry.key;
                            String option = entry.value;
                            bool isCorrect = idx == question.correctAnswer;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    isCorrect
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color:
                                        isCorrect ? Colors.green : Colors.red,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.bottomBarColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.bottomBarColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: Semantics(
                      label: 'Κουίζ Αποθηκευμένων Ερωτήσεων',
                      hint:
                          'Ξεκινάει μια εξέταση με τις αποθηκευμένες ερωτήσεις.',
                      child: ElevatedButton(
                        onPressed: () async {
                          final saveManager = SaveManager();
                          final savedQuestions =
                              await saveManager.loadSavedQuestions();
                          if (savedQuestions.isNotEmpty) {
                            Navigator.pushNamed(
                              context,
                              '/quiz',
                              arguments: 'ΑΕ',
                            );
                          } else {
                            return;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: AppColors.bottomBarButtonColor,
                          shadowColor: const Color(0xFFaaaaaa),
                        ),
                        child: const Text(
                          'Κουίζ Αποθηκευμένων Ερωτήσεων',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.bottomBarColor,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
