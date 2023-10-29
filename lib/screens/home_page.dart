import 'package:flutter/material.dart';
import 'package:khkt2223/components/quiz_screen.dart';
import 'package:khkt2223/course_screen.dart';
import 'package:khkt2223/screens/camera.dart';
import 'package:khkt2223/screens/tracking_page.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';
import 'package:khkt2223/widgets/task_column.dart';
import 'package:khkt2223/widgets/active_project_card.dart';
import 'package:khkt2223/widgets/top_container.dart';
import 'package:khkt2223/screens/searching.dart';
import 'package:khkt2223/screens/chatbot.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../components/score_screen.dart';
import '../constants.dart';
import 'main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins-Bold',
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return const CircleAvatar(
      radius: 25.0,
      backgroundColor: bgColor,
      child: Icon(
        Icons.chat_bubble,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: MediaQuery.of(context).size.width > 500 ? 250 : 400,
              width: width,
              padding: const EdgeInsets.all(0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu, color: Colors.white70, size: 30.0),
                        Icon(Icons.search, color: Colors.white70, size: 30.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        direction: MediaQuery.of(context).size.width > 500
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: const CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                          MediaQuery.of(context).size.width > 500
                              ? const SizedBox.shrink()
                              : const SizedBox(height: 20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Let's start",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 27.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Not all readers are leaders,\n but all leaders are readers.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Chức năng',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins-Bold'),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.chat,
                                        iconBackgroundColor: LightColors.kRed,
                                        title: 'Tư vấn',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CourseScreen()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.search,
                                        iconBackgroundColor:
                                            LightColors.kDarkYellow,
                                        title: "Bài tập",
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const QuizScreen()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.check,
                                        iconBackgroundColor: LightColors.kBlue,
                                        title: 'Kiểm Tra',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.report,
                                        iconBackgroundColor: LightColors.kGreen,
                                        title: 'Kết quả',
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tiến độ học tập',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins-Bold'),
                          ),
                          const SizedBox(height: 5.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackingPage()),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                ActiveProjectsCard(
                                  cardColor: kColor.withOpacity(0.3),
                                  loadingPercent: 0.25,
                                  title: 'Bài 1',
                                  subtitle: 'Phát âm',
                                ),
                                const SizedBox(width: 20.0),
                                ActiveProjectsCard(
                                  cardColor: kColor.withOpacity(0.3),
                                  loadingPercent: 0.65,
                                  title: 'Bài 2',
                                  subtitle: 'Phân biệt chữ cái',
                                ),
                                const SizedBox(width: 20.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
