import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 2:
                return 'Fev';
              case 4:
                return 'Mar';
              case 6:
                return 'Abr';
              case 8:
                return 'Mai';
              case 10:
                return 'Jun';
              case 12:
                return 'Jul';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10 KG';
              case 2:
                return '20 KG';
              case 3:
                return '30 KG';
              case 4:
                return '40 KG';
              case 5:
                return '50 KG';
              case 6:
                return '60 KG';
              case 7:
                return '70 KG';
              case 8:
                return '80 KG';
              case 9:
                return '90 KG';
              case 10:
                return '100 KG';
            }
            return '';
          },
          reservedSize: 35,
          margin: 20,
        ),
      );
}
