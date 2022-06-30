import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:flutter/material.dart';

class StepSintomas extends StatefulWidget {
  const StepSintomas({Key? key}) : super(key: key);

  @override
  _StepSintomasState createState() => _StepSintomasState();
}

class _StepSintomasState extends State<StepSintomas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Você possui algum desses sintomas?",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Column(
          children: CadastroController.instance.listSintomas
              .map((sintomas) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      sintomas.nome,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    value: sintomas.check,
                    onChanged: (val) {
                      setState(() {
                        if(!CadastroController.instance.listSintomas[0].check){    
                          sintomas.check = val!;
                          for (var i = 1; i < CadastroController.instance.listSintomas.length; i++){
                            if(sintomas.nome == 'Nenhum sintoma'){
                              CadastroController.instance.listSintomas[i].check = false;
                            } 
                          }
                        }else{
                          CadastroController.instance.listSintomas[0].check = false;
                        }
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class SintomasCheckbox {
  String nome;
  bool check;

  SintomasCheckbox(this.nome, this.check);
}
