import 'package:aplicacao/src/controllers/capitulos_controller.dart';
import 'package:aplicacao/src/views/home/lista_capitulos/card_item_capitulo.dart';
import 'package:aplicacao/src/views/home/lista_capitulos/item_capitulo.dart';
import 'package:flutter/material.dart';

class TabListCapitulos extends StatelessWidget {
  const TabListCapitulos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemCapitulo> _listCapitulos =
        CapitulosController.instance.itensCapitulos;
    var _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: _listCapitulos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, _listCapitulos[index].pathCapitulo);
                      },
                      child:
                          CardItemCapitulo(itemCapitulo: _listCapitulos[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
