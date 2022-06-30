import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:flutter/material.dart';

class StepRegiaoDor extends StatefulWidget {
  const StepRegiaoDor({Key? key}) : super(key: key);

  @override
  State<StepRegiaoDor> createState() => _StepRegiaoDorState();
}

class _StepRegiaoDorState extends State<StepRegiaoDor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Você está aqui por que sente dor nas costas?",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        ListTile(
          title: const Text(
            "Sim",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          leading: Radio(
            value: 0,
            groupValue: CadastroController.instance.senteDorController,
            onChanged: (value) {
              setState(() {
                CadastroController.instance.senteDorController = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
        ListTile(
          title: const Text(
            "Não",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          leading: Radio(
            value: 1,
            groupValue: CadastroController.instance.senteDorController,
            onChanged: (value) {
              setState(() {
                CadastroController.instance.senteDorController = value as int;
                // showSnackBar();
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
        const Text(
          "Em qual região das costas você sente dor?",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  CadastroController.instance.regiaoDaDorController = 0;
                }),
                child: Container(
                  height: 140,
                  width: 100,
                  color: CadastroController.instance.regiaoDaDorController == 0
                      ? CoresMovedor.primary
                      : Colors.transparent,
                  child: Card(
                      elevation: 1,
                      child: Image.asset("assets/images/regiao_lombar.png")),
                ),
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  CadastroController.instance.regiaoDaDorController = 1;
                  // showSnackBar();
                }),
                child: Container(
                  height: 140,
                  width: 100,
                  color: CadastroController.instance.regiaoDaDorController == 1
                      ? CoresMovedor.primary
                      : Colors.transparent,
                  child: Card(
                      elevation: 2,
                      child: Image.asset("assets/images/regiao_cervical.png")),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
Future<dynamic> watchUtilTheEndWarningShowDialogErro(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Aviso',
          textAlign: TextAlign.center,
          style: TextStyle(color: CoresMovedor.textoPadrao),
        ),
        content: Text(
          'O MoveDor é recomendado somente para pessoas com dores na região lombar!',
          textAlign: TextAlign.center,
          style: const TextStyle(color: CoresMovedor.textoPadrao),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  onPrimary: CoresMovedor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )),
              onPressed: (){
                Navigator.of(context).pop();   
              },
              child:Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              )         
            ),
          ),
        ],
      )
    );
  }
}
