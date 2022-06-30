import 'package:aplicacao/src/util/constantes_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionarioPeriodico {
  late String id;

  double escala_dor_grau;
  String escala_dor_tempo;

  String crencas_facil_machucar;
  String crencas_cuidadoso_machucar;
  String crencas_significa_lesionar;
  String crencas_fisgadinha_lesao;

  String crencas_evitar_exercicios;
  String crencas_manter_ativo;
  String crencas_focar_coisas;
  String crencas_ter_expectativa;
  String crencas_sempre_fraco;
  String crencas_nao_se_resolvera;

  bool medicamento_fico_em_casa;
  bool medicamento_mudo_de_posicao;
  bool medicamento_ando_mais_devagar;
  bool medicamento_nao_fazendo_trabalhos;
  bool medicamento_uso_o_corrimao;
  bool medicamento_me_deito_mais_frequentemente;
  bool medicamento_me_apoiar_para_levantar;
  bool medicamento_facam_coisas_para_mim;
  bool medicamento_me_visto_mais_lentamente;
  bool medicamento_somente_fico_em_pe;
  bool medicamento_evito_me_abaixar;
  bool medicamento_encontro_dificuldades_levantar;
  bool medicamento_minha_costas_doem;
  bool medicamento_dificuldade_virar_cama;
  bool medicamento_apetite_nao_muito_bom;
  bool medicamento_problemas_colocar_meias;
  bool medicamento_caminho_curtas_distancias;
  bool medicamento_nao_durmo_bem;
  bool medicamento_visto_com_ajuda;
  bool medicamento_fico_sentado_maior_parte;
  bool medicamento_evito_trabalhos_pesados;
  bool medicamento_irritado_e_mal_humorado;
  bool medicamento_subo_escadas_vagarosamente;
  bool medicamento_fico_na_cama;
  int quant_selecionados;

  late var data;

  DocumentReference? reference;

  QuestionarioPeriodico({
    this.id = "",
    this.data,
    this.escala_dor_grau = 0,
    this.escala_dor_tempo = "",
    this.crencas_facil_machucar = "",
    this.crencas_cuidadoso_machucar = "",
    this.crencas_significa_lesionar = "",
    this.crencas_fisgadinha_lesao = "",
    this.crencas_evitar_exercicios = "",
    this.crencas_manter_ativo = "",
    this.crencas_focar_coisas = "",
    this.crencas_ter_expectativa = "",
    this.crencas_sempre_fraco = "",
    this.crencas_nao_se_resolvera = "",
    this.medicamento_fico_em_casa = false,
    this.medicamento_mudo_de_posicao = false,
    this.medicamento_ando_mais_devagar = false,
    this.medicamento_nao_fazendo_trabalhos = false,
    this.medicamento_uso_o_corrimao = false,
    this.medicamento_me_deito_mais_frequentemente = false,
    this.medicamento_me_apoiar_para_levantar = false,
    this.medicamento_facam_coisas_para_mim = false,
    this.medicamento_me_visto_mais_lentamente = false,
    this.medicamento_somente_fico_em_pe = false,
    this.medicamento_evito_me_abaixar = false,
    this.medicamento_encontro_dificuldades_levantar = false,
    this.medicamento_minha_costas_doem = false,
    this.medicamento_dificuldade_virar_cama = false,
    this.medicamento_apetite_nao_muito_bom = false,
    this.medicamento_problemas_colocar_meias = false,
    this.medicamento_caminho_curtas_distancias = false,
    this.medicamento_nao_durmo_bem = false,
    this.medicamento_visto_com_ajuda = false,
    this.medicamento_fico_sentado_maior_parte = false,
    this.medicamento_evito_trabalhos_pesados = false,
    this.medicamento_irritado_e_mal_humorado = false,
    this.medicamento_subo_escadas_vagarosamente = false,
    this.medicamento_fico_na_cama = false,
    this.quant_selecionados = 0,
    this.reference,
  });

  factory QuestionarioPeriodico.fromDocument(DocumentSnapshot doc) {
    return QuestionarioPeriodico(
      id: doc['id'],
      escala_dor_grau: doc[ConstantesDatabase.ESCALA_DOR_GRAU],
      escala_dor_tempo: doc[ConstantesDatabase.ESCALA_DOR_TEMPO],
      crencas_facil_machucar: doc[ConstantesDatabase.CRENCAS_FACIL_MACHUCAR],
      crencas_cuidadoso_machucar:
          doc[ConstantesDatabase.CRENCAS_CUIDADOSO_MACHUCAR],
      crencas_significa_lesionar:
          doc[ConstantesDatabase.CRENCAS_SIGNIFICA_LESIONAR],
      crencas_fisgadinha_lesao:
          doc[ConstantesDatabase.CRENCAS_FISGADINHA_LESAO],
      crencas_evitar_exercicios:
          doc[ConstantesDatabase.CRENCAS_EVITAR_EXERCICIOS],
      crencas_manter_ativo: doc[ConstantesDatabase.CRENCAS_MANTER_ATIVO],
      crencas_focar_coisas: doc[ConstantesDatabase.CRENCAS_FOCAR_COISAS],
      crencas_ter_expectativa: doc[ConstantesDatabase.CRENCAS_TER_EXPECTATIVA],
      crencas_sempre_fraco: doc[ConstantesDatabase.CRENCAS_SEMPRE_FRACO],
      crencas_nao_se_resolvera:
          doc[ConstantesDatabase.CRENCAS_NAO_SE_RESOLVERA],
      medicamento_fico_em_casa:
          doc[ConstantesDatabase.MEDICAMENTO_FICO_EM_CASA],
      medicamento_mudo_de_posicao:
          doc[ConstantesDatabase.MEDICAMENTO_MUDO_DE_POSICAO],
      medicamento_ando_mais_devagar:
          doc[ConstantesDatabase.MEDICAMENTO_ANDO_MAIS_DEVAGAR],
      medicamento_nao_fazendo_trabalhos:
          doc[ConstantesDatabase.MEDICAMENTO_NAO_FAZENDO_TRABALHOS],
      medicamento_uso_o_corrimao:
          doc[ConstantesDatabase.MEDICAMENTO_USO_O_CORRIMAO],
      medicamento_me_deito_mais_frequentemente:
          doc[ConstantesDatabase.MEDICAMENTO_ME_DEITO_MAIS_FREQUENTEMENTE],
      medicamento_me_apoiar_para_levantar:
          doc[ConstantesDatabase.MEDICAMENTO_ME_APOIAR_PARA_LEVANTAR],
      medicamento_facam_coisas_para_mim:
          doc[ConstantesDatabase.MEDICAMENTO_FACAM_COISAS_PARA_MIM],
      medicamento_me_visto_mais_lentamente:
          doc[ConstantesDatabase.MEDICAMENTO_ME_VISTO_MAIS_LENTAMENTE],
      medicamento_somente_fico_em_pe:
          doc[ConstantesDatabase.MEDICAMENTO_SOMENTE_FICO_EM_PE],
      medicamento_evito_me_abaixar:
          doc[ConstantesDatabase.MEDICAMENTO_EVITO_ME_ABAIXAR],
      medicamento_encontro_dificuldades_levantar:
          doc[ConstantesDatabase.MEDICAMENTO_ENCONTRO_DIFICULDADES_LEVANTAR],
      medicamento_minha_costas_doem:
          doc[ConstantesDatabase.MEDICAMENTO_MINHA_COSTAS_DOEM],
      medicamento_dificuldade_virar_cama:
          doc[ConstantesDatabase.MEDICAMENTO_DIFICULDADE_VIRAR_CAMA],
      medicamento_apetite_nao_muito_bom:
          doc[ConstantesDatabase.MEDICAMENTO_APETITE_NAO_MUITO_BOM],
      medicamento_problemas_colocar_meias:
          doc[ConstantesDatabase.MEDICAMENTO_PROBLEMAS_COLOCAR_MEIAS],
      medicamento_caminho_curtas_distancias:
          doc[ConstantesDatabase.MEDICAMENTO_CAMINHO_CURTAS_DISTANCIAS],
      medicamento_nao_durmo_bem:
          doc[ConstantesDatabase.MEDICAMENTO_NAO_DURMO_BEM],
      medicamento_visto_com_ajuda:
          doc[ConstantesDatabase.MEDICAMENTO_VISTO_COM_AJUDA],
      medicamento_fico_sentado_maior_parte:
          doc[ConstantesDatabase.MEDICAMENTO_FICO_SENTADO_MAIOR_PARTE],
      medicamento_evito_trabalhos_pesados:
          doc[ConstantesDatabase.MEDICAMENTO_EVITO_TRABALHOS_PESADOS],
      medicamento_irritado_e_mal_humorado:
          doc[ConstantesDatabase.MEDICAMENTO_IRRITADO_E_MAL_HUMORADO],
      medicamento_subo_escadas_vagarosamente:
          doc[ConstantesDatabase.MEDICAMENTO_SUBO_ESCADAS_VAGAROSAMENTE],
      medicamento_fico_na_cama:
          doc[ConstantesDatabase.MEDICAMENTO_FICO_NA_CAMA],
      quant_selecionados: doc["quant_selecionados"],
      data: doc['data'],
      reference: doc.reference,
    );
  }

  factory QuestionarioPeriodico.fromJson(Map<String, dynamic> json) {
    return QuestionarioPeriodico(
      id: json['id'],
      escala_dor_grau: json[ConstantesDatabase.ESCALA_DOR_GRAU],
      escala_dor_tempo: json[ConstantesDatabase.ESCALA_DOR_TEMPO],
      crencas_facil_machucar: json[ConstantesDatabase.CRENCAS_FACIL_MACHUCAR],
      crencas_cuidadoso_machucar:
          json[ConstantesDatabase.CRENCAS_CUIDADOSO_MACHUCAR],
      crencas_significa_lesionar:
          json[ConstantesDatabase.CRENCAS_SIGNIFICA_LESIONAR],
      crencas_fisgadinha_lesao:
          json[ConstantesDatabase.CRENCAS_FISGADINHA_LESAO],
      crencas_evitar_exercicios:
          json[ConstantesDatabase.CRENCAS_EVITAR_EXERCICIOS],
      crencas_manter_ativo: json[ConstantesDatabase.CRENCAS_MANTER_ATIVO],
      crencas_focar_coisas: json[ConstantesDatabase.CRENCAS_FOCAR_COISAS],
      crencas_ter_expectativa: json[ConstantesDatabase.CRENCAS_TER_EXPECTATIVA],
      crencas_sempre_fraco: json[ConstantesDatabase.CRENCAS_SEMPRE_FRACO],
      crencas_nao_se_resolvera:
          json[ConstantesDatabase.CRENCAS_NAO_SE_RESOLVERA],
      medicamento_fico_em_casa:
          json[ConstantesDatabase.MEDICAMENTO_FICO_EM_CASA],
      medicamento_mudo_de_posicao:
          json[ConstantesDatabase.MEDICAMENTO_MUDO_DE_POSICAO],
      medicamento_ando_mais_devagar:
          json[ConstantesDatabase.MEDICAMENTO_ANDO_MAIS_DEVAGAR],
      medicamento_nao_fazendo_trabalhos:
          json[ConstantesDatabase.MEDICAMENTO_NAO_FAZENDO_TRABALHOS],
      medicamento_uso_o_corrimao:
          json[ConstantesDatabase.MEDICAMENTO_USO_O_CORRIMAO],
      medicamento_me_deito_mais_frequentemente:
          json[ConstantesDatabase.MEDICAMENTO_ME_DEITO_MAIS_FREQUENTEMENTE],
      medicamento_me_apoiar_para_levantar:
          json[ConstantesDatabase.MEDICAMENTO_ME_APOIAR_PARA_LEVANTAR],
      medicamento_facam_coisas_para_mim:
          json[ConstantesDatabase.MEDICAMENTO_FACAM_COISAS_PARA_MIM],
      medicamento_me_visto_mais_lentamente:
          json[ConstantesDatabase.MEDICAMENTO_ME_VISTO_MAIS_LENTAMENTE],
      medicamento_somente_fico_em_pe:
          json[ConstantesDatabase.MEDICAMENTO_SOMENTE_FICO_EM_PE],
      medicamento_evito_me_abaixar:
          json[ConstantesDatabase.MEDICAMENTO_EVITO_ME_ABAIXAR],
      medicamento_encontro_dificuldades_levantar:
          json[ConstantesDatabase.MEDICAMENTO_ENCONTRO_DIFICULDADES_LEVANTAR],
      medicamento_minha_costas_doem:
          json[ConstantesDatabase.MEDICAMENTO_MINHA_COSTAS_DOEM],
      medicamento_dificuldade_virar_cama:
          json[ConstantesDatabase.MEDICAMENTO_DIFICULDADE_VIRAR_CAMA],
      medicamento_apetite_nao_muito_bom:
          json[ConstantesDatabase.MEDICAMENTO_APETITE_NAO_MUITO_BOM],
      medicamento_problemas_colocar_meias:
          json[ConstantesDatabase.MEDICAMENTO_PROBLEMAS_COLOCAR_MEIAS],
      medicamento_caminho_curtas_distancias:
          json[ConstantesDatabase.MEDICAMENTO_CAMINHO_CURTAS_DISTANCIAS],
      medicamento_nao_durmo_bem:
          json[ConstantesDatabase.MEDICAMENTO_NAO_DURMO_BEM],
      medicamento_visto_com_ajuda:
          json[ConstantesDatabase.MEDICAMENTO_VISTO_COM_AJUDA],
      medicamento_fico_sentado_maior_parte:
          json[ConstantesDatabase.MEDICAMENTO_FICO_SENTADO_MAIOR_PARTE],
      medicamento_evito_trabalhos_pesados:
          json[ConstantesDatabase.MEDICAMENTO_EVITO_TRABALHOS_PESADOS],
      medicamento_irritado_e_mal_humorado:
          json[ConstantesDatabase.MEDICAMENTO_IRRITADO_E_MAL_HUMORADO],
      medicamento_subo_escadas_vagarosamente:
          json[ConstantesDatabase.MEDICAMENTO_SUBO_ESCADAS_VAGAROSAMENTE],
      medicamento_fico_na_cama:
          json[ConstantesDatabase.MEDICAMENTO_FICO_NA_CAMA],
      quant_selecionados: json['quant_selecionados'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.data;

    data[ConstantesDatabase.ESCALA_DOR_GRAU] = escala_dor_grau;
    data[ConstantesDatabase.ESCALA_DOR_TEMPO] = escala_dor_tempo;

    data[ConstantesDatabase.CRENCAS_FACIL_MACHUCAR] = crencas_facil_machucar;
    data[ConstantesDatabase.CRENCAS_CUIDADOSO_MACHUCAR] =
        crencas_facil_machucar;
    data[ConstantesDatabase.CRENCAS_SIGNIFICA_LESIONAR] =
        crencas_significa_lesionar;
    data[ConstantesDatabase.CRENCAS_FISGADINHA_LESAO] =
        crencas_fisgadinha_lesao;

    data[ConstantesDatabase.CRENCAS_EVITAR_EXERCICIOS] =
        crencas_evitar_exercicios;
    data[ConstantesDatabase.CRENCAS_MANTER_ATIVO] = crencas_manter_ativo;
    data[ConstantesDatabase.CRENCAS_FOCAR_COISAS] = crencas_focar_coisas;
    data[ConstantesDatabase.CRENCAS_TER_EXPECTATIVA] = crencas_ter_expectativa;
    data[ConstantesDatabase.CRENCAS_SEMPRE_FRACO] = crencas_sempre_fraco;
    data[ConstantesDatabase.CRENCAS_NAO_SE_RESOLVERA] =
        crencas_nao_se_resolvera;
    data[ConstantesDatabase.MEDICAMENTO_FICO_EM_CASA] =
        medicamento_fico_em_casa;
    data[ConstantesDatabase.MEDICAMENTO_MUDO_DE_POSICAO] =
        medicamento_mudo_de_posicao;
    data[ConstantesDatabase.MEDICAMENTO_ANDO_MAIS_DEVAGAR] =
        medicamento_ando_mais_devagar;
    data[ConstantesDatabase.MEDICAMENTO_NAO_FAZENDO_TRABALHOS] =
        medicamento_nao_fazendo_trabalhos;
    data[ConstantesDatabase.MEDICAMENTO_USO_O_CORRIMAO] =
        medicamento_uso_o_corrimao;
    data[ConstantesDatabase.MEDICAMENTO_ME_DEITO_MAIS_FREQUENTEMENTE] =
        medicamento_me_deito_mais_frequentemente;
    data[ConstantesDatabase.MEDICAMENTO_ME_APOIAR_PARA_LEVANTAR] =
        medicamento_me_apoiar_para_levantar;
    data[ConstantesDatabase.MEDICAMENTO_FACAM_COISAS_PARA_MIM] =
        medicamento_facam_coisas_para_mim;
    data[ConstantesDatabase.MEDICAMENTO_ME_VISTO_MAIS_LENTAMENTE] =
        medicamento_me_visto_mais_lentamente;
    data[ConstantesDatabase.MEDICAMENTO_SOMENTE_FICO_EM_PE] =
        medicamento_somente_fico_em_pe;
    data[ConstantesDatabase.MEDICAMENTO_EVITO_ME_ABAIXAR] =
        medicamento_evito_me_abaixar;
    data[ConstantesDatabase.MEDICAMENTO_ENCONTRO_DIFICULDADES_LEVANTAR] =
        medicamento_encontro_dificuldades_levantar;
    data[ConstantesDatabase.MEDICAMENTO_MINHA_COSTAS_DOEM] =
        medicamento_minha_costas_doem;
    data[ConstantesDatabase.MEDICAMENTO_DIFICULDADE_VIRAR_CAMA] =
        medicamento_dificuldade_virar_cama;
    data[ConstantesDatabase.MEDICAMENTO_APETITE_NAO_MUITO_BOM] =
        medicamento_apetite_nao_muito_bom;
    data[ConstantesDatabase.MEDICAMENTO_PROBLEMAS_COLOCAR_MEIAS] =
        medicamento_problemas_colocar_meias;
    data[ConstantesDatabase.MEDICAMENTO_CAMINHO_CURTAS_DISTANCIAS] =
        medicamento_caminho_curtas_distancias;
    data[ConstantesDatabase.MEDICAMENTO_NAO_DURMO_BEM] =
        medicamento_nao_durmo_bem;
    data[ConstantesDatabase.MEDICAMENTO_VISTO_COM_AJUDA] =
        medicamento_visto_com_ajuda;
    data[ConstantesDatabase.MEDICAMENTO_FICO_SENTADO_MAIOR_PARTE] =
        medicamento_fico_sentado_maior_parte;
    data[ConstantesDatabase.MEDICAMENTO_EVITO_TRABALHOS_PESADOS] =
        medicamento_evito_trabalhos_pesados;
    data[ConstantesDatabase.MEDICAMENTO_IRRITADO_E_MAL_HUMORADO] =
        medicamento_irritado_e_mal_humorado;
    data[ConstantesDatabase.MEDICAMENTO_SUBO_ESCADAS_VAGAROSAMENTE] =
        medicamento_subo_escadas_vagarosamente;
    data[ConstantesDatabase.MEDICAMENTO_FICO_NA_CAMA] =
        medicamento_fico_na_cama;
    data['quant_selecionados'] = quant_selecionados;

    return data;
  }

  Future save() async {
    if (reference == null) {
      reference = FirebaseFirestore.instance
          .collection(ConstantesDatabase.Q_PERIODICO)
          .doc();

      await reference?.set(toJson());
    } else {
      await reference!.update(toJson());
    }
  }

  Future delete() async {
    await reference!.delete();
  }
}
