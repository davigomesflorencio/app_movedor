import 'package:aplicacao/src/models/questionario_periodico.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuestionariosPeriodicosController extends GetxController {
  late String uid;

  RxDouble escalaDeDor = (0.0).obs;
  RxString tempoDeDor = 'menos de 3 meses'.obs;

  // Questionários sobre suas propria costas e sua recuperacao
  RxString p1_facilMachucar = "".obs;
  RxString p2_cuidadasoMachucar = "".obs;
  RxString p3_significaLesionar = "".obs;
  RxString p4_fisgadinhaLesao = "".obs;

  RxString p5_evitarExercicios = "".obs;
  RxString p6_manterAtivo = "".obs;
  RxString p7_focarCoisas = "".obs;
  RxString p8_terExpectativa = "".obs;
  RxString p9_sempreFraco = "".obs;
  RxString p10_naoSeResolvera = "".obs;

  List<String> questions = [
    'Fico em casa a maior parte do tempo por causa das minhas costas.',
    'Mudo de posição frequentemente tentando deixar minhas costas confortáveis.',
    'Ando mais devagar que o habitual por causa das minhas costas.',
    'Por causa das minhas costas, eu não estou fazendo nenhum dos meus trabalhos que geralmente faço em casa.',
    'Por causa das minhas costas, eu uso o corrimão para subir as escadas.',
    'Por causa das minhas costas, eu me deito para descansar mais frequentemente.',
    'Por causa das minhas costas, eu tenho que me apoiar em alguma coisa para me levantar de uma cadeira normal.',
    'Por causa das minhas costas, tento conseguir com que outras pessoas façam as coisas para mim.',
    'Eu me visto mais lentamente do que o habitual por causa das minhas costas.',
    'Eu somente fico em pé por períodos curtos de tempo por causa das minhas costas.',
    'Por causa das minhas costas, evito me abaixar ou me ajoelhar.',
    'Encontro dificuldades em me levantar de uma cadeira por causa de minhas costas.',
    'As minhas costas doem quase o tempo todo.',
    'Tenho dificuldade em me virar na cama por causa de minhas costas.',
    'Meu apetite não é muito bom por causa das dores em minhas costas.',
    'Tenho problemas para colocar minhas meias (ou meia-calça) por causa das minhas costas.',
    'Caminho apenas curtas distâncias por causa de minhas dores nas costas.',
    'Não durmo tão bem por causa das minhas costas.',
    'Por causa das minhas costas, eu me visto com ajuda de outras pessoas.',
    'Fico sentado a maior parte do dia por causa das minhas costas.',
    'Evito trabalhos pesados em casa por causa das minhas costas.',
    'Por causa das minhas costas, fico mais irritado e mal humorado com as pessoas do que o habitual.',
    'Por causa de minhas costas, eu subo escadas mais vagarosamente do que o habitual.',
    'Fico na cama a maior parte do tempo por causa das minhas costas.'
  ];

  RxList<bool> respostasMedicamentos = RxList.generate(24, (index) => false);

  RxDouble groupValue0 = (-1.0).obs;
  RxDouble groupValue1 = (-1.0).obs;
  RxDouble groupValue2 = (-1.0).obs;
  RxDouble groupValue3 = (-1.0).obs;

  RxDouble groupValue4 = (-1.0).obs;
  RxDouble groupValue5 = (-1.0).obs;
  RxDouble groupValue6 = (-1.0).obs;
  RxDouble groupValue7 = (-1.0).obs;
  RxDouble groupValue8 = (-1.0).obs;
  RxDouble groupValue9 = (-1.0).obs;

  RxBool clickValidate1 = false.obs;
  RxBool clickValidate2 = false.obs;

  bool validateQ1() {
    if ([
      groupValue0.value,
      groupValue1.value,
      groupValue2.value,
      groupValue3.value,
    ].any((x) => x == -1)) {
      return false;
    }
    return true;
  }

  bool validateQ2Parte1() {
    if ([
      groupValue4.value,
      groupValue5.value,
      groupValue6.value,
    ].any((x) => x == -1)) {
      return false;
    }

    return true;
  }

  bool validateQ2Parte2() {
    if ([
      groupValue7.value,
      groupValue8.value,
      groupValue9.value,
    ].any((x) => x == -1)) {
      return false;
    }

    return true;
  }

  clearValueControllers() {
    escalaDeDor.value = (0.0);
    tempoDeDor.value = 'menos de 3 meses';
    p1_facilMachucar.value = "";
    p2_cuidadasoMachucar.value = "";
    p3_significaLesionar.value = "";
    p4_fisgadinhaLesao.value = "";
    p5_evitarExercicios.value = "";
    p6_manterAtivo.value = "";
    p7_focarCoisas.value = "";
    p8_terExpectativa.value = "";
    p9_sempreFraco.value = "";
    p10_naoSeResolvera.value = "";

    groupValue0.value = (-1.0);
    groupValue1.value = (-1.0);
    groupValue2.value = (-1.0);
    groupValue3.value = (-1.0);
    groupValue4.value = (-1.0);
    groupValue5.value = (-1.0);
    groupValue6.value = (-1.0);
    groupValue7.value = (-1.0);
    groupValue8.value = (-1.0);
    groupValue9.value = (-1.0);
    clickValidate1.value = false;
    clickValidate2.value = false;

    for (int i = 0; i < 24; i++) respostasMedicamentos[i] = false;
  }

  void setQuestionarioPeriodico(QuestionarioPeriodico questionarioPeriodico) {
    uid = AuthService.authInstance.getUID();

    escalaDeDor.value = questionarioPeriodico.escala_dor_grau;
    tempoDeDor.value = questionarioPeriodico.escala_dor_tempo;

    p1_facilMachucar.value = questionarioPeriodico.crencas_facil_machucar;
    p2_cuidadasoMachucar.value =
        questionarioPeriodico.crencas_cuidadoso_machucar;
    p3_significaLesionar.value =
        questionarioPeriodico.crencas_significa_lesionar;
    p4_fisgadinhaLesao.value = questionarioPeriodico.crencas_fisgadinha_lesao;
    p5_evitarExercicios.value = questionarioPeriodico.crencas_evitar_exercicios;
    p6_manterAtivo.value = questionarioPeriodico.crencas_manter_ativo;
    p7_focarCoisas.value = questionarioPeriodico.crencas_focar_coisas;
    p8_terExpectativa.value = questionarioPeriodico.crencas_ter_expectativa;
    p9_sempreFraco.value = questionarioPeriodico.crencas_sempre_fraco;
    p10_naoSeResolvera.value = questionarioPeriodico.crencas_nao_se_resolvera;
  }

  Future saveQuestionarioPeriodicos() async {
    uid = AuthService.authInstance.getUID();
    QuestionarioPeriodico questionariosPeriodicos = QuestionarioPeriodico();
    questionariosPeriodicos.id = uid;
    questionariosPeriodicos.data = FieldValue.serverTimestamp();

    questionariosPeriodicos.escala_dor_grau = escalaDeDor.value;
    questionariosPeriodicos.escala_dor_tempo = tempoDeDor.value;

    questionariosPeriodicos.crencas_facil_machucar = p1_facilMachucar.value;
    questionariosPeriodicos.crencas_cuidadoso_machucar =
        p2_cuidadasoMachucar.value;
    questionariosPeriodicos.crencas_significa_lesionar =
        p3_significaLesionar.value;
    questionariosPeriodicos.crencas_fisgadinha_lesao = p4_fisgadinhaLesao.value;

    questionariosPeriodicos.crencas_evitar_exercicios =
        p5_evitarExercicios.value;
    questionariosPeriodicos.crencas_manter_ativo = p6_manterAtivo.value;
    questionariosPeriodicos.crencas_focar_coisas = p7_focarCoisas.value;
    questionariosPeriodicos.crencas_ter_expectativa = p8_terExpectativa.value;
    questionariosPeriodicos.crencas_sempre_fraco = p9_sempreFraco.value;
    questionariosPeriodicos.crencas_nao_se_resolvera = p10_naoSeResolvera.value;

    questionariosPeriodicos.medicamento_fico_em_casa = respostasMedicamentos[0];
    questionariosPeriodicos.medicamento_mudo_de_posicao =
        respostasMedicamentos[1];
    questionariosPeriodicos.medicamento_ando_mais_devagar =
        respostasMedicamentos[2];
    questionariosPeriodicos.medicamento_nao_fazendo_trabalhos =
        respostasMedicamentos[3];
    questionariosPeriodicos.medicamento_uso_o_corrimao =
        respostasMedicamentos[4];
    questionariosPeriodicos.medicamento_me_deito_mais_frequentemente =
        respostasMedicamentos[5];
    questionariosPeriodicos.medicamento_me_apoiar_para_levantar =
        respostasMedicamentos[6];
    questionariosPeriodicos.medicamento_facam_coisas_para_mim =
        respostasMedicamentos[7];
    questionariosPeriodicos.medicamento_me_visto_mais_lentamente =
        respostasMedicamentos[8];
    questionariosPeriodicos.medicamento_somente_fico_em_pe =
        respostasMedicamentos[9];
    questionariosPeriodicos.medicamento_evito_me_abaixar =
        respostasMedicamentos[10];
    questionariosPeriodicos.medicamento_encontro_dificuldades_levantar =
        respostasMedicamentos[11];
    questionariosPeriodicos.medicamento_minha_costas_doem =
        respostasMedicamentos[12];
    questionariosPeriodicos.medicamento_dificuldade_virar_cama =
        respostasMedicamentos[13];
    questionariosPeriodicos.medicamento_apetite_nao_muito_bom =
        respostasMedicamentos[14];
    questionariosPeriodicos.medicamento_problemas_colocar_meias =
        respostasMedicamentos[15];
    questionariosPeriodicos.medicamento_caminho_curtas_distancias =
        respostasMedicamentos[16];
    questionariosPeriodicos.medicamento_nao_durmo_bem =
        respostasMedicamentos[17];
    questionariosPeriodicos.medicamento_visto_com_ajuda =
        respostasMedicamentos[18];
    questionariosPeriodicos.medicamento_fico_sentado_maior_parte =
        respostasMedicamentos[19];
    questionariosPeriodicos.medicamento_evito_trabalhos_pesados =
        respostasMedicamentos[20];
    questionariosPeriodicos.medicamento_irritado_e_mal_humorado =
        respostasMedicamentos[21];
    questionariosPeriodicos.medicamento_subo_escadas_vagarosamente =
        respostasMedicamentos[22];
    questionariosPeriodicos.medicamento_fico_na_cama =
        respostasMedicamentos[23];
    questionariosPeriodicos.quant_selecionados =
        respostasMedicamentos.where((item) => item == true).length;

    await FirestoreDatabaseService.instance.saveQuestionariosPeriodicos(
        questionariosPeriodicos: questionariosPeriodicos);
  }
}
