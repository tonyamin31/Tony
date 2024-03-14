import 'package:flutter/material.dart';
import 'package:medverse/Custom_Widgets/AppBar.dart';

import '../Custom_Widgets/naviagtion/CustomFloating.dart';
import '../Custom_Widgets/naviagtion/footer3.dart';
import 'second_page.dart';
import 'widgets/container.dart';

class viewbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(PageName: 'Prescreption'),
      body: ListView(children: [
        Column(children: [
          const SizedBox(height: 100),
          container(),
          SizedBox(height: 10),
          container(),
          SizedBox(height: 10),
          container(),
        ])
      ]),
      floatingActionButton: CustomFloating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer3(),
    );
  }
}
