import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khkt2223/constants.dart';
import 'package:khkt2223/controllers/question_controller.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreen();
}

class _ScoreScreen extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: LightColors.kLavender,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: LightColors.kLavender,
        elevation: 0,
      ),
      body: Stack(
        //fit: StackFit.expand,
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Row(
            children: [
              const Spacer(flex: 1),
              Text(
                "Kết quả",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${(_qnController.numOfCorrectAns / _qnController.questions.length * 100).round()}%",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
