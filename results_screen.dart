import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz/question.dart';
import 'package:flutter_application_1/quiz/question_summary.dart';
import 'package:flutter_application_1/quiz/test_screen.dart';


void backToHomePage(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

 
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers});
  final List<String> chosenAnswers;
  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answers':questions[i].answers[0],
        'user_answer':chosenAnswers[i],
      });
    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context)
  {
    final summaryData=getSummaryData();
    final numberTotalQuestions=questions.length;
    final numCorrectAnswer=summaryData.where((data) {
      return data['user_answer']==data['correct_answers'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment:MainAxisAlignment.center,
          // ignore: unnecessary_const
          children: [
            Text('You answerd $numCorrectAnswer out of $numberTotalQuestions question correct!',style: const TextStyle(
                    color: Colors.white, // 
                    fontSize: 25,
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed:() {
                backToHomePage(StartScreen as BuildContext);
              } ,
              child:  const Text('Restart Quiz!',
                style: TextStyle(
                          color: Colors.white,
                          fontSize: 20 // 
                ),),
            )
          ],
        ),
      ),
    ); 
  }
}
