import './motivos.dart';

extension MotivosParse on Motivos {
  static const strings = {
    Motivos.motivo1: "Falta de tempo ou outras atividades",
    Motivos.motivo2: "Dor na coluna durante o exercício",
    Motivos.motivo3: "Fadiga após a atividade física",
    Motivos.motivo4: "Não consegui perceber os benefícios",
    Motivos.motivo5: "Me sinto desmotivado(a)",
    Motivos.motivo6: "Essa atividade não é prazerosa/divertida para mim",
    Motivos.motivo7:
        "Medo de realizar o exercício por não ter a supervisão de um profissional",
    Motivos.motivo8: "Não acho mais necessário pois não sinto mais dor",
    Motivos.motivo9: "Falta de espaço",
    Motivos.motivo10: "Motivos econômicos",
    Motivos.motivo11: "Outros",
  };

  static Motivos? fromString(String str) {
    for (var e in Motivos.values) {
      if (e.parseToString() == str) return e;
    }
    return null;
  }

  static const frases = {
    Motivos.motivo1: "Uma sugestão para lidar com a falta de tempo é realizar "
        "um planejamento do seu dia e da sua semana, encaixando o exercício entre "
        "as tantas tarefas que temos no nosso dia-a-dia. É importante lembrar "
        "que o exercício, assim como os medicamentos, precisam de uma dose e "
        "tempo para que os efeitos positivos sejam percebidos.",
    Motivos.motivo2: "Quando você evita realizar algum movimento ou atividade "
        "devido a dor, você está colaborando para a persistência desta dor. O "
        "movimento pode te ajudar com isso! Você pode começar aos poucos, com "
        "movimentos mais fáceis e simples, vá evoluindo conforme você vai se "
        "acostumando.",
    Motivos.motivo3: "A dor muscular sensação de cansaço após o exercício é "
        "esperado. Essa sensação pode aparecer até três dias após o exercício. "
        "Normalmente as dores desaparecem gradualmente. Dores leves, por pouco "
        "tempo, não devem ser motivo para parar de realizar a atividade. Se as "
        "dores forem intensas e prolongadas podem indicar a necessidade de rever "
        "a intensidade do exercício. Inicie devagar e vá evoluindo conforme você "
        "vai se acostumando",
    Motivos.motivo4: "Os estudos científicos recomendam a realização de "
        "exercícios físicos para o tratamento da dor nas costas. Os benefícios "
        "do exercício físico incluem redução da dor e retorno das atividades de "
        "vida diária. É importante lembrar que o exercício, assim como os "
        "medicamentos, precisam de uma dose e tempo para que os efeitos positivos "
        "sejam percebidos.",
    Motivos.motivo5: "Se você não conseguiu realizar o que programou, "
        "experimente realizar outra atividade que desperte o seu interesse e lhe "
        "traga bem-estar. Uma opção também é buscar a companhia de amigos e "
        "parentes que já estejam engajados em alguma atividade.",
    Motivos.motivo6: "O melhor exercício para quem tem dor lombar é aquele que "
        "você sente prazer em praticar. Escolha um exercício pensando em suas "
        "necessidades, preferências e a capacidade de realizá-lo",
    Motivos.motivo7: "Se você não se sente confiante em realizar o exercício, "
        "escolha um exercício pensando em suas necessidades, preferências e a "
        "capacidade de realizá-lo. Um exercício simples, barato e de fácil acesso "
        "é a caminhada. E você sempre pode ir até a unidade de saúde próxima da "
        "sua casa e buscar orientações",
    Motivos.motivo8: "A constância é fundamental para você conseguir lidar com "
        "a sua condição de saúde e manter os benefícios obtidos.",
    Motivos.motivo9: "Um exercício simples, barato e de fácil acesso é a "
        "caminhada. Você pode realizar esta atividade no seu quarteirão, em uma "
        "pracinha pública mais próxima ou até mesmo dentro de casa.",
    Motivos.motivo10: "Um exercício simples, barato e de fácil acesso é a "
        "caminhada. Lembre-se, escolha um exercício pensando em suas necessidades, "
        "preferências e a capacidade de realizá-lo",
    Motivos.motivo11: "",
  };

  String parseToString() {
    return strings[this]!;
  }

  String feedback() {
    return frases[this]!;
  }
}
