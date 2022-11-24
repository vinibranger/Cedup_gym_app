



import 'package:flutter/material.dart';


import 'pages/login/auth_check.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PERSOUFIT',
      home: AuthCheck(),
    );
  }
}
