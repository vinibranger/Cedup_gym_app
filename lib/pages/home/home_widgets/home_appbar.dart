import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text("MEUS ALUNOS"),
    centerTitle: true,
    backgroundColor: Color(0xff0A6D92), 
    actions: [
      IconButton(
        icon: const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
