import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz/question.dart';
import 'package:flutter_application_1/quiz/test_screen.dart';
import 'package:flutter_application_1/quiz/Qust_scrren.dart';
import 'package:flutter_application_1/quiz/results_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _quizState();
  }
}

// ignore: camel_case_types
class _quizState extends State<Quiz>{
    final List<String> _selectedAnswer=[];
    var activescreen='start-screen';

    void switchscreen()
    {
      setState(() {
        activescreen= 'question-screen';
      });
    }
    void chooseAnswer(String answer)
    {
      _selectedAnswer.add(answer);
      if(_selectedAnswer.length==questions.length)
      {
        setState(() {
          activescreen='results-screen';
        });
      }
    }
  @override
  Widget build( context) {
  Widget screenwidget=StartScreen(switchscreen);
    if (activescreen=='question-screen') {
      screenwidget =   Quest_screen(
        onSelectAnswer:  chooseAnswer,
      );
    }
    if(activescreen=='results-screen')
    {
      screenwidget=ResultsScreen(chosenAnswers: _selectedAnswer,);
    }
    return MaterialApp(
        home: Scaffold(
          body:Container(
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255,107,15,168),
                ],
                begin: Alignment.topLeft,
                end : Alignment.bottomRight
            )
          ),
          child: screenwidget ,
        ),
      ),
    );
  }
}
