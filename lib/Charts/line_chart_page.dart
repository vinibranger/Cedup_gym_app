import 'package:flutter/material.dart';

import 'line_chart_widget.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 15),
          child: LineChartWidget(),
        ),
      );
}

//0xff020227
