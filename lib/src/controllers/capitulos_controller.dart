import 'package:aplicacao/src/views/home/lista_capitulos/item_capitulo.dart';

class CapitulosController {
  static CapitulosController instance = CapitulosController();

  //Pesquisa atividades fisicas
  List<ItemCapitulo> itensCapitulos = [
    ItemCapitulo(
        titulo: "Conceitos básicos",
        descricaoConteudo: "Entenda o que é",
        pathImagem: "assets/images/capitulos/cap1_illustration.png",
        pathCapitulo: "/capitulo01"),
    ItemCapitulo(
        titulo: "Importância do movimento",
        descricaoConteudo: "Saiba onde procurar tratamento",
        pathImagem: "assets/images/capitulos/cap3_illustration.png",
        pathCapitulo: "/capitulo03"),
    ItemCapitulo(
        titulo: "Exercícios físicos",
        descricaoConteudo: "Entenda os benefícios dos exercícios físicos",
        pathImagem: "assets/images/capitulos/cap4_illustration.png",
        pathCapitulo: "/capitulo04"),
    ItemCapitulo(
        titulo: "Apoio especializado",
        descricaoConteudo: "Saiba onde pedir ajuda.",
        pathImagem: "assets/images/capitulos/cap5_illustration.png",
        pathCapitulo: "/capitulo05"),
    ItemCapitulo(
        titulo: "Teste seus conhecimentos",
        descricaoConteudo: "Vamos responder algumas dúvidas a respeito da DLC!",
        pathImagem: "assets/images/capitulos/cap6_illustration.png",
        pathCapitulo: "/capitulo06"),
  ];
}
