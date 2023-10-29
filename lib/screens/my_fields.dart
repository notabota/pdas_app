import 'package:get/get.dart';
import 'package:khkt2223/controllers/question_controller.dart';
import 'package:khkt2223/file_info_card.dart';
import 'package:khkt2223/models/MyFiles.dart';
import 'package:khkt2223/responsive.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  _MyFilesState createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  late Socket socket;

  @override
  void initState() {
    super.initState();
    debugPrint("initState() called");
    connectAndListen();
  }

  void connectAndListen() {
    IO.Socket socket = IO.io('https://nodejs-khkt20222023.herokuapp.com/',
        IO.OptionBuilder().setTransports(['websocket']).build());
    // debugPrint('connect');
    QuestionController _qnController = Get.put(QuestionController());
    int res =
        (_qnController.numOfCorrectAns / _qnController.questions.length * 100)
            .round();
    socket.onConnect((_) {
      debugPrint('connect');
      socket.emit('res_ans', res);
    });
    // socket.emit('res_ans', res);
    socket.onDisconnect((_) => debugPrint('disconnect'));
  }

  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    QuestionController _qnController = Get.put(QuestionController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tổng quan",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white70),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Kết quả chẩn đoán",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: kDefaultPadding,
        mainAxisSpacing: kDefaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
