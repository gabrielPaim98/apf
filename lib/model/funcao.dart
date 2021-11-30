enum Complexidade { BAIXA, MEDIA, ALTA }

enum TipoFuncao { ALI, AIE, EE, SE, CE }

enum TipoManutencao { INCLUSAO, ALTERACAO, EXCLUSAO }

class Aplicacao {
  String nome = '';
  double custoPPF = 10;
  List<Funcao> funcoes = [];

  double get totalPF {
    double pfaux = 0;
    funcoes.forEach((element) {
      pfaux += element.pf;
    });
    return pfaux;
  }

  double get custoTotal {
    return custoPPF * totalPF;
  }
}

class Funcao {
  Funcao({
    required this.nome,
    required this.tipoFuncao,
    required this.tipoManutencao,
    this.td = 0,
    this.tr = 0,
  });

  String nome = '';
  TipoFuncao tipoFuncao = TipoFuncao.ALI;
  TipoManutencao tipoManutencao = TipoManutencao.INCLUSAO;
  double td = 0;
  double tr = 0;

  double get pf {
    if (tipoFuncao == TipoFuncao.ALI) {
      if (complexidade == Complexidade.BAIXA) {
        return 7;
      } else if (complexidade == Complexidade.MEDIA) {
        return 10;
      } else {
        return 15;
      }
    } else if (tipoFuncao == TipoFuncao.AIE) {
      if (complexidade == Complexidade.BAIXA) {
        return 5;
      } else if (complexidade == Complexidade.MEDIA) {
        return 7;
      } else {
        return 10;
      }
    } else if (tipoFuncao == TipoFuncao.SE) {
      if (complexidade == Complexidade.BAIXA) {
        return 4;
      } else if (complexidade == Complexidade.MEDIA) {
        return 5;
      } else {
        return 7;
      }
    } else {
      if (complexidade == Complexidade.BAIXA) {
        return 3;
      } else if (complexidade == Complexidade.MEDIA) {
        return 4;
      } else {
        return 6;
      }
    }
  }

  Complexidade get complexidade {
    if (tipoFuncao == TipoFuncao.EE) {
      if (tr >= 3 && td >= 5) {
        return Complexidade.ALTA;
      } else if (tr >= 3 && td < 5) {
        return Complexidade.MEDIA;
      } else if (tr >= 2 && td >= 16) {
        return Complexidade.ALTA;
      } else if (tr >= 2 && td <= 4) {
        return Complexidade.BAIXA;
      } else if (tr >= 2 && td > 4) {
        return Complexidade.MEDIA;
      } else if (tr < 2 && td <= 15) {
        return Complexidade.BAIXA;
      } else {
        return Complexidade.MEDIA;
      }
    } else if (tipoFuncao == TipoFuncao.AIE || tipoFuncao == TipoFuncao.ALI) {
      if (tr >= 6 && td >= 20) {
        return Complexidade.ALTA;
      } else if (tr >= 6 && td < 20) {
        return Complexidade.MEDIA;
      } else if (tr >= 2 && td >= 51) {
        return Complexidade.ALTA;
      } else if (tr >= 2 && td < 20) {
        return Complexidade.BAIXA;
      } else if (tr >= 2 && td >= 20) {
        return Complexidade.MEDIA;
      } else if (tr < 2 && td <= 50) {
        return Complexidade.BAIXA;
      } else {
        return Complexidade.MEDIA;
      }
    } else {
      if (tr >= 4 && td >= 6) {
        return Complexidade.ALTA;
      } else if (tr >= 4 && td < 6) {
        return Complexidade.MEDIA;
      } else if (tr >= 2 && td >= 20) {
        return Complexidade.ALTA;
      } else if (tr >= 2 && td <= 5) {
        return Complexidade.BAIXA;
      } else if (tr >= 2 && td > 5) {
        return Complexidade.MEDIA;
      } else if (tr < 2 && td <= 19) {
        return Complexidade.BAIXA;
      } else {
        return Complexidade.MEDIA;
      }
    }
  }
}
