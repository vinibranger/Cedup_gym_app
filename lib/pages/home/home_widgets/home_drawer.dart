import 'package:flutter/material.dart';
import 'package:teste/Charts/chart_page.dart';
import 'package:teste/pages/home/add_exercicio/cadExecicio.dart';
import 'package:teste/pages/home/home_page_trainer.dart';

import '../../../shared/constants/custom_colors.dart';

import '../../login/login_page.dart';

Drawer getHomeDrawer(Type buildContext, BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xff0A6D92)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
          ),
          accountEmail: null,
          accountName: null,
        ),
        ListTile(
            leading: Icon(
              Icons.home,
              color: CustomColors().getAppBarMainColor(),
            ),
            title: const Text(
              "Tela Inicial",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.event_busy_outlined,
              color: CustomColors().getAppBarMainColor(),
            ),
            title: const Text(
              "Evolução",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChartPage()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.add_circle_sharp,
              color: CustomColors().getAppBarMainColor(),
            ),
            title: const Text(
              "Adicionar Exercicio",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CadExerci()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.arrow_back_sharp,
              color: CustomColors().getAppBarMainColor(),
            ),
            title: const Text(
              "Sair",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }),
      ],
    ),
  );
}
