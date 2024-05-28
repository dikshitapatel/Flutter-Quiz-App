import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_view_model.dart';

void main() {
  runApp(MyQuizApp());
}

// Defines the root widget of the application.
class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        // Provider for managing state.
        create: (context) => MyQuizViewModel(),
        // QuizView is the main view of the quiz application.
        child: QuizView(),
      ),
    );
  }
}

// Represents the main view of the quiz app, displaying the questions and answers.
class QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar at the top of the view.
      appBar: AppBar(title: Text("myQuiz")),
      // SingleChildScrollView allows the content to be scrollable.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Consumer<MyQuizViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // Displays the quiz question.
                    width: 250,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      viewModel.expression,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("=", style: TextStyle(fontSize: 24)),
                  ),
                  Container(
                    // Displays the quiz answer.
                    width: 250,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      viewModel.answer,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Spacer(),
                        // Displays the total count of attempted quizzes.
                        Text("Total Counts: ${viewModel.roundCount}", style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        // Button to generate a new quiz.
                        ElevatedButton(
                          onPressed: viewModel.generateQuiz,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue.withOpacity(0.8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              viewModel.buttonText,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  // Button to solve the current quiz.
                  ElevatedButton(
                    onPressed: viewModel.solveQuiz,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.withOpacity(0.8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,
                      elevation: 10,
                    ),
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(8),
                      child: const Text(
                        "Solve",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}