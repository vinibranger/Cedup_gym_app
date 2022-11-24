import 'package:flutter/material.dart';

import '../../../shared/models/cliente_Aluno.dart';


class HomeModalAdd extends StatefulWidget {
  final List<Aluno_cliente>? listAluno;
  

  HomeModalAdd({this.listAluno});

  @override
  _HomeModalAddState createState() => _HomeModalAddState();
}

class _HomeModalAddState extends State<HomeModalAdd> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _generoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Adicionar Aluno",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Qual é o código do aluno?",
                ),
              ),
              
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              ElevatedButton(
                onPressed: () {
                  addInList();
                },
                child: const Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addInList() {
    Aluno_cliente hml = Aluno_cliente(
      icone_aluno: "assets/user.png",
      name: _nameController.text,
      genero: _generoController.text,
    );
    setState(() {
      widget.listAluno?.add(hml);
    });

    Navigator.pop(context);
  }
}
