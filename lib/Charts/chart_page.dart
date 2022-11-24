import 'package:flutter/material.dart';

import '../main.dart';
import '../pages/home/home_widgets/home_drawer.dart';
import 'line_chart_page.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text("EVOLUÇÃO"),
            centerTitle: true,
            backgroundColor: const Color(0xff0A6D92)),
        drawer: getHomeDrawer(BuildContext, context),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: PageView(
            children: [
              LineChartPage(),
            ],
          ),
        ),
      );
}
