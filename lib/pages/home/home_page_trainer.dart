import 'package:flutter/material.dart';
import 'package:teste/Repository/AlunoRepository.dart';
import 'package:teste/pages/home/home_widgets/home_fab.dart';
import '../../shared/models/cliente_Aluno.dart';
import 'home_widgets/home_appbar.dart';
import 'home_widgets/home_drawer.dart';
import 'medidas_aluno.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabela = AlunoRepository.tabela;
  List<Aluno_cliente> selecionados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getHomeAppBar(),
        drawer: getHomeDrawer(BuildContext, context),
        floatingActionButton: getHomeFab(context, tabela, refreshPage),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int aluno) {
              return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                leading: (selecionados.contains(tabela[aluno]))
                    ? const CircleAvatar(
                        child: Icon(Icons.check),
                      )
                    : SizedBox(
                        child:
                            Image.asset(tabela[aluno].icone_aluno.toString()),
                      ),
                title: Text(tabela[aluno].name.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                trailing: Text(tabela[aluno].genero.toString()),
                selected: selecionados.contains(tabela[aluno]),
                selectedTileColor: Colors.indigo[50],
                onLongPress: () {
                  setState(() {
                    (selecionados.contains(tabela[
                            aluno])) // SE TIVER SELECIONADO O ALUNO ELA RETIRAR
                        ? selecionados.remove(tabela[aluno])
                        : selecionados.add(tabela[aluno]);
                  });
                },
                onTap: () => avaliFisica(tabela[aluno]),
              );
            },
            padding: const EdgeInsets.all(20),
            separatorBuilder: (_, ___) => const Divider(),
            itemCount: tabela.length));
  }

  refreshPage() {
    setState(() {});
  }

  avaliFisica(Aluno_cliente tabela) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => MedidaAlunos(aluno: tabela)));
  }

  
}
