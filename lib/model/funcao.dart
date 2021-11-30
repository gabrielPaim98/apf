enum Complexidade { BAIXA, MEDIA, ALTA }

enum TipoFuncao { ALI, AIE, EE, SE, CE }

enum TipoManutencao { I, A, E }

class Aplicacao {
  String nome = '';
  double custoPPF = 0;
  List<Funcao> funcoes = [];

  double get totalPF {
    return 0;
  }

  double get custoTotal {
    return 0;
  }
}

class Funcao {
  Funcao({
    required this.nome,
    required this.tipoFuncao,
    required this.tipoManutencao,
    this.tipoDado = 0,
    this.arquivosReferenciados = 0,
  });

  String nome = '';
  TipoFuncao tipoFuncao = TipoFuncao.ALI;
  TipoManutencao tipoManutencao = TipoManutencao.I;
  double tipoDado = 0;
  double arquivosReferenciados = 0;

  double get pf {
    return 0;
  }

  Complexidade get complexidade {
    return Complexidade.BAIXA;
  }
}
