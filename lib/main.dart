import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_quizzler/quiz_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() => runApp(GQuizzlar());

QuizBank quizBank = new QuizBank();

class GQuizzlar extends StatelessWidget {
  const GQuizzlar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: GQuizPage(),
          ),
        ),
      ),
    );
  }
}

class GQuizPage extends StatefulWidget {
  const GQuizPage({super.key});

  @override
  State<GQuizPage> createState() => _GQuizPageState();
}

class _GQuizPageState extends State<GQuizPage> {
  List<Icon> scoreKeeper = [];

  void showGifDialog(String gif,String text1,String text2){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return GiffyDialog.image(
            Image.asset(gif,
              height: 200,
              fit: BoxFit.cover,),
            title: Text(
              text1,
              textAlign: TextAlign.center,
            ),
            content: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
            actions: [
              // TextButton(
              //   onPressed: () => Navigator.pop(context, 'CANCEL'),
              //   child: const Text('CANCEL'),
              // ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          );
        }
    );
  }

  void checkAnswers(bool userPickedAnswer){
    bool correctAnswer = quizBank.getAnswer();
    int score = quizBank.getTotalScore();
    setState(() {
      if(quizBank.isFinished()==true){
        // Alert(
        //     context: context,
        //     title: 'Finished!',
        //     desc: 'You got $score points in this quiz',
        // ).show();

        if(score==quizBank.getQuestionNumber()){
          showGifDialog('assets/yay.gif','Okay Fine','But Love Me More');
        }else{
          showGifDialog('assets/kitten_hitting.gif','You only got $score points!', 'Love Me More.');
        }
        quizBank.reset();
        scoreKeeper = [];
      }else{
        if(userPickedAnswer == correctAnswer) {
          quizBank.scoreCalculate();
          scoreKeeper.add(Icon(Icons.check, color: Colors.pink,));
        }else {
          scoreKeeper.add(Icon(Icons.close,color: Colors.black));
        }
        quizBank.nextQuestion();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBank.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswers(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswers(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper
        ),
      ],
    );
  }
}
