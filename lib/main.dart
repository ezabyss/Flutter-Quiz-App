import 'package:flutter/material.dart';
import 'quiz_brain.dart';

// initialize the questionAns Class
QuestionAns quizBrain = QuestionAns();

void main() => runApp(const Quizzler());

// Main app widget
class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange, // Background color
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// Stateful widget for the quiz page
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = []; // Keeps track of user's score

  // To show how many question they answered correctly & wrongly
  int totalCorrect = 0;
  int totalWrong = 0;

  // Function to check the user's answer and update the score
  void checkAnswer(bool userPickedAnswer) {

    bool correctAnswer = quizBrain.getCorrectAns();
    setState(() {
      // Add check or close icon based on the user's answer
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        totalCorrect++;
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        totalWrong++;
      }
      // Move to the next question or reset the quiz when finished

      // if quizBrain.nextQuestion() return true it negates & makes it fall
      // if quizBrain.nextQuestion() return true it negates & makes it true which means no question left & calls the ResetQuiz()
      if (!quizBrain.nextQuestion()){
        resetQuiz();
      }
      // quizBrain.nextQuestion();
    });
  }

  // Function to reset the quiz after all questions are answered
  void resetQuiz() {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent from dismission popup by pressing outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Text(
              'Restarting the quiz. \n Correct Answer : $totalCorrect \n Wrong Answer: $totalWrong'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                setState(() {
                  // questionNum = 0; // Reset question index
                  scoreKeeper.clear(); // Clear score icons
                  totalCorrect=0; // reset the right answer counter
                  totalWrong=0; // reset the wrong answer counter
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display the current question
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              quizBrain.getQuestion(), // Show the current question
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28.0),
            ),
          ),
        ),

        // True button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => checkAnswer(true), // Check if the answer is true
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),

        // False button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () =>
                  checkAnswer(false), // Check if the answer is false
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),

        // Display score icons (check or close)
        // Wrap instead of row helps that the content don't goes out of screen
        Wrap(
          children: scoreKeeper,
        )
      ],
    );
  }
}
