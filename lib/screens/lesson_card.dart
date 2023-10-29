import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:khkt2223/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:khkt2223/theme/icons.dart';
import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  const LessonCard({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer _timer;
    int _start = 10;
    const oneSec = Duration(seconds: 10);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        children: [
          GestureDetector(
            //style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent)),
            onTap: () =>
                AudioPlayer().play(AssetSource('sounds/${lesson.fileName}')),
            child: lesson.isPlaying
                ? Image.asset(
              icLearning,
              height: 45,
            )
                : Image.asset(
              icPlayNext,
              height: 45,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  lesson.duration,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              bool hasPermission = await AnotherAudioRecorder.hasPermissions;
              String customPath = '/another_audio_recorder_';
              io.Directory appDocDirectory;
              if (io.Platform.isIOS) {
                appDocDirectory = await getApplicationDocumentsDirectory();
              } else {
                appDocDirectory = (await getExternalStorageDirectory())!;
              }
              customPath = appDocDirectory.path +
                  customPath +
                  DateTime.now().millisecondsSinceEpoch.toString();
              var recorder =
              AnotherAudioRecorder(customPath, audioFormat: AudioFormat.WAV);
              await recorder.initialized;
              await recorder.start();

              _timer = Timer(oneSec, () async {
                var result = await recorder.stop();
                if (result != null) {
                  print(result.path!);
                  // File file = File(result.path!);

                  var postUri = Uri.parse("http://127.0.0.1:5000/");
                  var request = http.MultipartRequest("GET", postUri);
                  request.fields['lesson'] = lesson.name;
                  request.files.add(http.MultipartFile.fromBytes('file',
                      await File.fromUri(Uri.parse(result.path!)).readAsBytes(),
                      contentType: MediaType('video', 'wav')));

                  final responseStream = await request.send();
                  final response = await responseStream.stream.bytesToString();
                  //TODO: Hiện response popup
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'Kết quả',
                    desc: response,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                }
              });
            },
            child: lesson.isCompleted
                ? Image.asset(
              icDone,
              height: 30,
            )
                : Image.asset(
              icLock,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}