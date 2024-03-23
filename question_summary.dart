import 'package:flutter/material.dart';
class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary (this.summaryData,{super.key});
  final List<Map<String,Object>> summaryData;

  @override

  Widget build(BuildContext context)
  {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
                return Row(children:[
                  Expanded(
                    child: Column(children: [
                    Text(((data['question_index'] as int) +1,)
                            .toString(), style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18 // 
                        ),),
                      Text(data['question'] as String,
                          style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String, style: const TextStyle(
                          color: Color.fromARGB(255, 255, 177, 177),
                          fontSize: 18 // 
                        ),),
                      Text(data['correct_answers'] as String, style: const TextStyle(
                          color: Color.fromARGB(255, 236, 229, 229),
                          fontSize: 18 // 
                        ),),
                    ],),
                  ),
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
