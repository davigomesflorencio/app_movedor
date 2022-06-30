import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:flutter/material.dart';

class StepAtividadesFisicas extends StatefulWidget {
  const StepAtividadesFisicas({Key? key}) : super(key: key);

  @override
  _StepAtividadesFisicasState createState() => _StepAtividadesFisicasState();
}

class _StepAtividadesFisicasState extends State<StepAtividadesFisicas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Você pratica alguma atividade física?",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Column(
          children: CadastroController.instance.listaAtividades
              .map((atividades) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      atividades.nome,
                      style: const TextStyle(fontSize: 16),
                    ),
                    value: atividades.check,
                    onChanged: (val) {
                      setState(() {       
                        if(!CadastroController.instance.listaAtividades[6].check){    
                            atividades.check = val!;
                            for (var i = 0; i < CadastroController.instance.listaAtividades.length - 1; i++){
                              if(atividades.nome == 'Não pratico atividades físicas'){
                                CadastroController.instance.listaAtividades[i].check = false;
                              } 
                            }
                          }else{
                            CadastroController.instance.listaAtividades[6].check = false;
                          }
                        }
                      );
                    },
                  )).toList(),
        ),
      ],
    );
  }
}

class AtividadeFisicaCheckbox {
  String nome;
  bool check;

  AtividadeFisicaCheckbox(this.nome, this.check);
}
