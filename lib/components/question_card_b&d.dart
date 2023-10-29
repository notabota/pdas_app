import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khkt2223/controllers/question_controller.dart';
import 'package:khkt2223/models/Questions.dart';

import '../constants.dart';
import 'option.dart';

class QuestionCard3 extends StatelessWidget {

  const QuestionCard3({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white70),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ElevatedButton(
            onPressed: () => AudioPlayer().play(AssetSource('sounds/haychontutuongungvoibuchinhsauday.mp3')),
            child: const Icon(Icons.play_arrow),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Image.asset(
              'assets/pics/${question.fileName}.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
          ),
          const SizedBox(height: kDefaultPadding / 2),

            ...List.generate(
              question.options.length,
                  (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            ),
        ],
      ),
    );
  }
}