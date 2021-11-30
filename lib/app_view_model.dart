import 'package:flutter/foundation.dart';

import 'model/funcao.dart';

class AppViewModel extends ChangeNotifier {
  Aplicacao aplicacao = Aplicacao();

  void setNomeAplicacao(String name) {
    aplicacao.nome = name;
    notifyListeners();
  }

  void setCustoPPF(double custo) {
    aplicacao.custoPPF = custo;
    notifyListeners();
  }

  void addFuncao(Funcao novaFuncao) {
    aplicacao.funcoes.add(novaFuncao);
    notifyListeners();
  }

  void removeFuncao(int index) {
    aplicacao.funcoes.removeAt(index);
    notifyListeners();
  }
}

List<Funcao> mockFunc = [
  Funcao(
    nome: 'Cadastrar Paciente',
    tipoFuncao: TipoFuncao.EE,
    tipoManutencao: TipoManutencao.INCLUSAO,
  ),
  Funcao(
    nome: 'Cadastrar Atendimento',
    tipoFuncao: TipoFuncao.EE,
    tipoManutencao: TipoManutencao.INCLUSAO,
  ),
  Funcao(
    nome: 'Consultar Atendimento Previstos',
    tipoFuncao: TipoFuncao.CE,
    tipoManutencao: TipoManutencao.INCLUSAO,
  ),
  Funcao(
    nome: 'Consultar Diagnosticos',
    tipoFuncao: TipoFuncao.CE,
    tipoManutencao: TipoManutencao.INCLUSAO,
  ),
  Funcao(
    nome: 'Horas Trabalhadas por médico',
    tipoFuncao: TipoFuncao.SE,
    tipoManutencao: TipoManutencao.INCLUSAO,
  ),
];
