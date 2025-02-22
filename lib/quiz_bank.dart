import 'package:g_quizzler/question.dart';

class QuizBank{
  int _questionNumber = 0;
  int _score = 0;
  List<Question> _questionBank = [
    Question('Pu Tuu thinks surprises are better than planned events.', true),
    Question('Pu Tuu loves you more than Malar Xing Guo.', true),
    Question('Pu Tuu likes holding hands more than hugging.', false),
    Question('Pu Tuu would rather spend a night watching the stars than at a party.', true),
    Question('Pu Tuu is more of an introvert than an extrovert.', true),
    Question('Pu Tuu prefers coffee over tea.', false),
    Question(
        'Pu Tuu loves text messages more than handwritten letters.',
        false),
    Question(
        'Pu Tuu has a childhood stuffed toy that still kept.',
        true),
    Question(
        'Pu Tuu eats in her sleep sometimes.',
        true),
    Question(
        'Pu Tuu loves listening to music while working/studying.',
        true),
    Question('Pu Tuu would rather spends a weekend in the mountains than at the beach.', false),
    Question(
        'Pu Tuu believes small romantic gestures are more meaningful than grand ones.',
        true),
    Question(
        'Pu Tuu likes the way I say your name.',
        false),
  ];

  String getQuestion(){
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer(){
    return _questionBank[_questionNumber].questionAns;
  }

  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }

  void scoreCalculate(){
    _score ++;
  }

  int getQuestionNumber(){
    return _questionBank.length-1;
  }

  int getTotalScore(){
    return _score;
  }

  bool isFinished(){
    if(_questionNumber==_questionBank.length-1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
    _score = 0;
  }

}