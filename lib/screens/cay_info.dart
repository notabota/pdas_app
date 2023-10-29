import 'package:flutter/material.dart';
import 'package:khkt2223/screens/search_plant.dart';
import 'package:khkt2223/screens/info_components/body.dart';
class Cay_info extends StatelessWidget {
  final Plant plant;
  const Cay_info({Key? key, required this.plant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(plant.title),
        // ),
    // );
        body: Body(plant: plant),
    );
  }
}
