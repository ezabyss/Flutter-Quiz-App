// class to represent quiz questions

class Question {

  final String quest;  // Question text
  final bool ans;      // correct answer (true/false)

  // Constructor to initialize the question and answer
  // The 'required' keyword ensures both values must be provided when creating a Question object.
  // const Constructor – Optimizes performance when questions are defined at compile time
  const Question({required this.quest, required this.ans}); // directly store value in the variable using this
}
