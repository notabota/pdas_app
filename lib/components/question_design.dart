import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khkt2223/components/question_card.dart';
import 'package:khkt2223/controllers/question_controller.dart';
import 'package:khkt2223/components/question_card_left_right.dart';
import 'package:khkt2223/components/question_card_b&d.dart';
import 'question_card_math.dart';
import 'question_card_section.dart';

class QuestionDesign extends StatelessWidget{
  final int index;
  const QuestionDesign({
    Key? key,
    required this.index
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    // if(index >= 0 && index<=2) return QuestionCard2(question: _questionController.questions[index]);
    // if (index >=3 && index<=5) return QuestionCard3(question: _questionController.questions[index]);
    // if (index >=6 && index<=8) return QuestionCardMath(question: _questionController.questions[index]);
    // if(index ==12) return QuestionCardSection(question: _questionController.questions[index]);
    return QuestionCardNormal(question: _questionController.questions[index]);
    //question: _questionController.questions[index]
  }
}