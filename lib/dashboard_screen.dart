import 'package:khkt2223/responsive.dart';
import 'package:khkt2223/screens/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:khkt2223/screens/storage_details.dart';
import 'constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(kDefaultPadding * .8),
        child: Column(
          children: [
            //Header(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: kDefaultPadding * .8),
                      const StorageDetails(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: kDefaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: kDefaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
