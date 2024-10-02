import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import '../models/questions.dart';

class SaveManager {
  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/saved_questions.json';
  }

  Future<void> saveQuestion(Question question) async {
    final path = await getFilePath();
    final file = File(path);

    List<dynamic> savedQuestions = [];
    if (await file.exists()) {
      final contents = await file.readAsString();
      savedQuestions = json.decode(contents);
    }

    savedQuestions.add(question.toJson());
    await file.writeAsString(json.encode(savedQuestions));
  }

  Future<void> unsaveQuestion(Question question) async {
    final path = await getFilePath();
    final file = File(path);

    if (await file.exists()) {
      final contents = await file.readAsString();
      List<dynamic> savedQuestions = json.decode(contents);

      savedQuestions.removeWhere((savedQuestion) =>
          savedQuestion['questionTitle'] == question.questionTitle);

      await file.writeAsString(json.encode(savedQuestions));
    }
  }

  Future<bool> isQuestionSaved(Question question) async {
    final path = await getFilePath();
    final file = File(path);

    if (await file.exists()) {
      final contents = await file.readAsString();
      List<dynamic> savedQuestions = json.decode(contents);

      return savedQuestions.any((savedQuestion) =>
          savedQuestion['questionTitle'] == question.questionTitle);
    }

    return false;
  }

  Future<List<Question>> loadSavedQuestions() async {
    final path = await getFilePath();
    final file = File(path);

    if (!await file.exists()) {
      return [];
    }

    final contents = await file.readAsString();
    final List<dynamic> jsonList = json.decode(contents);

    return jsonList.map((json) => Question.fromJson(json)).toList();
  }
}
