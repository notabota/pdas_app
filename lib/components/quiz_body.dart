import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khkt2223/constants.dart';
import 'package:khkt2223/controllers/question_controller.dart';
import 'package:khkt2223/components/question_design.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';
import 'progress_bar.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have access our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Stack(
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar(),
                ),
                const SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                        () => Text.rich(
                      TextSpan(
                        text:
                        "Câu hỏi ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: LightColors.kLavender),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: LightColors.kLavender),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionDesign(index: index),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
