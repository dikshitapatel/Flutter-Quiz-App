class MyQuizModel {
  // Optional integer fields for the first and second numbers in the quiz.
  int? num1;
  int? num2;

  // Constructor allowing initialization of num1 and num2, both of which are optional.
  MyQuizModel({this.num1, this.num2});

  // Getter that calculates the solution of the quiz.
  // Returns the sum of num1 and num2 if both are not null, otherwise returns null.
  int? get solution => (num1 != null && num2 != null) ? num1! + num2! : null;
}
