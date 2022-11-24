import '../shared/models/cliente_Aluno.dart';

class AlunoRepository {
  static List<Aluno_cliente> tabela = [
    Aluno_cliente(
        icone_aluno: 'assets/call.png', name: 'VINI', genero: 'Masculino'),
    Aluno_cliente(
        icone_aluno: 'assets/envelope.png', name: 'test', genero: 'Masculino'),
    Aluno_cliente(
        icone_aluno: 'assets/location.png', name: 'ola', genero: 'feminino'),
  ];
}
