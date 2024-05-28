import 'dart:math';
import 'package:flutter/foundation.dart';
import 'my_quiz_model.dart';

class MyQuizViewModel extends ChangeNotifier {
  MyQuizModel _quiz = MyQuizModel(); 
  String expression = "Expression"; 
  String answer = "Solution";
  int _roundCount = 0; // Counter for the number of rounds played.
  String buttonText = "Play"; 

  // Getter to expose the private _roundCount to other parts of the app.
  int get roundCount => _roundCount;


  void generateQuiz() {
    _quiz.num1 = Random().nextInt(101); // Random number between 0 and 100 inclusive.
    _quiz.num2 = Random().nextInt(101);
    expression = "${_quiz.num1} + ${_quiz.num2}";
    answer = "?";
    _roundCount++;
    buttonText = "Play Again";
    notifyListeners(); // Notify widgets listening to changes in QuizViewModel.
  }

  // Solves the current quiz by calculating the solution from the model.
  // Updates the answer and notifies listeners about the change.
  void solveQuiz() {
    final solution = _quiz.solution;
    if (solution != null) {
      answer = solution.toString();
      notifyListeners();
    }
  }
}
