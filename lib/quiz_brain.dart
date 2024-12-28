import 'package:quizzler/question.dart';

class QuestionAns{

  int questionNum = 0; // Current question index/position

  // List of questions and their corresponding answers
  // to control the any kind of manipulation in the actual answer we can make the object private
  // its the example of encapsulation
  // making the questionBank private

  final List<Question> _questionBank = [
    Question(quest: 'Nepal is a landlocked country.', ans: true),
    Question(quest: 'Mount Everest is in Nepal.', ans: true),
    Question(quest: 'The capital of Nepal is Kathmandu.', ans: true),
    Question(quest: 'Nepal’s national language is Hindi.', ans: false),
    Question(
        quest: 'Lumbini, the birthplace of Buddha, is in Nepal.', ans: true),
    Question(quest: 'Pokhara is called the city of lakes.', ans: true),
    Question(quest: 'Nepal is located in Africa.', ans: false),
    Question(quest: 'The national flag of Nepal is triangular.', ans: true),
    Question(
        quest: 'Pashupatinath Temple is a famous Hindu temple in Nepal.',
        ans: true),
    Question(
        quest: 'Sagarmatha is the Nepali name for Mount Everest.', ans: true),
  ];


  bool nextQuestion(){
    if (questionNum < _questionBank.length-1) {
      questionNum++;
      return true; // sends true, if question left
    }
    questionNum=0; // makes the questionNum to 0
    return false; // sends false, if no question left to trigger reset quiz on main.dart
  }


  // to control any manipulation from main.dart, we use methods to get & send values
  // this method will be called from main.dart to get the question
  String getQuestion(){
    return _questionBank[questionNum].quest;
  }

  // return correct answer
  bool getCorrectAns(){
    return _questionBank[questionNum].ans;
  }

  // return length of list
  // int getLength(){
  //   return _questionBank.length;
  // }

}