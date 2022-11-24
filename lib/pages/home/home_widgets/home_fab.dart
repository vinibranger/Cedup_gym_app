import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:teste/pages/home/home_widgets/home_modal_add.dart';
import '../../../shared/models/cliente_Aluno.dart';


FloatingActionButton getHomeFab(BuildContext context, List<Aluno_cliente> tabela, Function() refreshPage)
//List<Aluno_cliente> listAluno,
  //Function fncRefresh,

{
  return FloatingActionButton(
    child: const Text(
      "+",
      style: TextStyle(fontSize: 24),
    ),
    onPressed: () async {
      return await showBarModalBottomSheet(context: context, builder:(context) => HomeModalAdd());
      
    },
  );
}
