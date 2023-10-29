import 'package:flutter/material.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';
import 'package:khkt2223/screens/list_day_data_model.dart';

class TrackingPage extends StatelessWidget {
  TrackingPage({Key? key}) : super(key: key);

  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }
  static List<String> listDay = ["Ngay 1", "Ngay 2","Ngay 3"];
  final List<ListDayDataModel> listDayData = List.generate(
      listDay.length,
          (index)
      => ListDayDataModel(listDay[index],'desc'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: ListView.builder(
        itemCount: listDayData.length,

        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(listDayData[index].name),
              leading: const SizedBox(
                width: 50,
                height: 50,
              ),
            ),
          );
        }
      ),
    );
  }
}