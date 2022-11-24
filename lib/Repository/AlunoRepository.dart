import '../shared/models/cliente_Aluno.dart';

class AlunoRepository {
  static List<Aluno_cliente> tabela = [
    Aluno_cliente(
        icone_aluno: 'assets/user.png', name: 'VINI', genero: 'Masculino'),
    Aluno_cliente(
        icone_aluno: 'assets/user.png', name: 'João', genero: 'Masculino'),
    Aluno_cliente(
        icone_aluno: 'assets/user.png', name: 'Paula', genero: 'Feminino'),
  ];
}
