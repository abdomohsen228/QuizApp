// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/quiz/answers.button.dart';
import 'package:flutter_application_1/quiz/question.dart';
import 'package:google_fonts/google_fonts.dart';// ignore: camel_case_types
// ignore: camel_case_types
class Quest_screen extends StatefulWidget{
  const Quest_screen({super.key,required this.onSelectAnswer,});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Quest_screen>createState(){
    return _Quest_screenState();
  }
}
// ignore: camel_case_types
class _Quest_screenState extends State<Quest_screen>{
  var currentQuestionIndex=0;
  
  answersQuestion(String selectedAnswer )  {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build( context) {
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//coulmn
          crossAxisAlignment: CrossAxisAlignment.stretch,//row
          children: [
          Text(currentQuestion.text,
          style: GoogleFonts.lato(
            color:const Color.fromARGB(255,201,153,251),
            fontSize:24,
            fontWeight:FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const  SizedBox(height: 30,),
        ...currentQuestion.getShuffledAnsewrs().map((ans) {
          return Answers(answerText: ans, onTap: (){
            answersQuestion(ans);
          },);
        })
        ],
        ),
      ),
    );
  }
}
