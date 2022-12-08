import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/Input_decore.dart';
import '../../shared/models/cliente_Aluno.dart';

class MedidaAlunos extends StatefulWidget {
  Aluno_cliente aluno;

  MedidaAlunos({Key? key, required this.aluno}) : super(key: key);
  @override
  _MedidaAlunosState createState() => _MedidaAlunosState();
}

class _MedidaAlunosState extends State<MedidaAlunos> {
  List<Map<String, dynamic>> meuDataBase = [];
  TextEditingController pesoAluno = TextEditingController();
  TextEditingController alturaAluno = TextEditingController();
  TextEditingController bracoAluno = TextEditingController();
  TextEditingController troncoAluno = TextEditingController();
  TextEditingController pernasAluno = TextEditingController();
  TextEditingController dateAvali = TextEditingController();

  final GlobalKey<FormState> _formKeyAvFisica = GlobalKey<FormState>();

  String _infoText = '';

  void _calculate() {
    setState(() {
      double peso = double.parse(pesoAluno.text);
      double altura = double.parse(alturaAluno.text) / 100;
      double imc = peso / (altura * altura);
      check_imc(imc);
    });
  }

  void check_imc(double imc) {
    if (imc < 18.6) {
      _infoText = 'Abaixo do Peso (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 18.6 && imc < 24.9) {
      _infoText = 'Peso Ideal (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 24.9 && imc < 29.9) {
      _infoText = 'Levemente Acima do Peso (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 29.9 && imc < 34.9) {
      _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 34.9 && imc < 39.9) {
      _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 40) {
      _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(4)})';
    }
  }

  void showMyForm(int? id) async {
    if (id != null) {
      final existingData =
          meuDataBase.firstWhere((element) => element['id'] == id);
      pesoAluno.text = existingData['peso'];
      alturaAluno.text = existingData['altura'];
      bracoAluno.text = existingData['braco'];
      troncoAluno.text = existingData['tronco'];
      pernasAluno.text = existingData['perna'];
      dateAvali.text = existingData['data'];
    } else {
      pesoAluno.text = "";
      alturaAluno.text = "";
      troncoAluno.text = "";
      troncoAluno.text = "";
      troncoAluno.text = "";
      pernasAluno.text = "";
      dateAvali.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A6D92),
        title: Text(widget.aluno.name.toString()),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    'AVALIAÇÃO FISICA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Form(
                    key: _formKeyAvFisica,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration:
                                Input_decore().textInputDecoration('MÊS'),
                            controller: dateAvali,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "INSIRA O MÊS!";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:
                                Input_decore().textInputDecoration('PESO(KG)'),
                            controller: pesoAluno,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "INSIRA O PESO!";
                              }
                              return null;
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: Input_decore()
                                .textInputDecoration('ALTURA (CM)'),
                            controller: alturaAluno,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Insira sua Altura!';
                              }
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: Input_decore()
                                .textInputDecoration('BRAÇO (CM)'),
                            controller: bracoAluno,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'INSIRA A MEDIDA';
                              }
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: Input_decore()
                                .textInputDecoration('TRONCO (CM)'),
                            controller: troncoAluno,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'INSIRA A MEDIDA';
                              }
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0), // espço
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: Input_decore()
                                .textInputDecoration('PERNAS (CM)'),
                            controller: pernasAluno,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'INSIRA A MEDIDA';
                              }
                            },
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: Text(
                            _infoText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          decoration:
                              Input_decore().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          //BOTÃO REGISTRAR

                          decoration:
                              Input_decore().buttonBoxDecoration(context),

                          child: ElevatedButton(
                            style: Input_decore().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "SALVAR".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKeyAvFisica.currentState!.validate()) {
                                _calculate();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Salvo com sucesso')));
                            }
                            },
                          ),
                        ),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
