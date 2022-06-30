import 'package:aplicacao/src/views/home/lista_capitulos/item_capitulo.dart';
import 'package:flutter/material.dart';

class CardItemCapitulo extends StatelessWidget {
  final ItemCapitulo itemCapitulo;
  const CardItemCapitulo({Key? key, required this.itemCapitulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: SizedBox(
          height: size.height * 0.2,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Image.asset(
                  itemCapitulo.pathImagem,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        itemCapitulo.titulo,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        itemCapitulo.descricaoConteudo,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
