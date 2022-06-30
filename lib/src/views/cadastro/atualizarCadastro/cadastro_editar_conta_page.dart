import 'dart:async';
import 'package:mask/mask/mask.dart';
import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/util/constantes_dialog.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_ativ_fisicas.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_cadastro_inicial.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_dados_pessoais.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_regiao_dor.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_sintomas.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/input_text.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class CadastroEditarContaPage extends StatefulWidget {
  const CadastroEditarContaPage({Key? key}) : super(key: key);

  @override
  _CadastroEditarContaPageState createState() => _CadastroEditarContaPageState();
  
}

class _CadastroEditarContaPageState extends State<CadastroEditarContaPage> {
  int yearChosen = 0;
  int yearCurrent = 0;
  int age = 0;

  var controller = CadastroController.instance;
  int _stepSelecionado = 0;

  @override
  void dispose() {
    controller.limparValoresDoController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      CadastroController.instance.listaAtividades[0].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_caminhar as bool;
      CadastroController.instance.listaAtividades[1].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_correr as bool;
      CadastroController.instance.listaAtividades[2].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_dancar as bool;
      CadastroController.instance.listaAtividades[3].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_nadar as bool;
      CadastroController.instance.listaAtividades[4].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_academia as bool;
      CadastroController.instance.listaAtividades[5].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_outras as bool;
      CadastroController.instance.listaAtividades[6].check = CadastroController.instance.atividadeFisicaEditar.ativ_fisica_nao_pratica as bool;
    });

    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar cadastro",
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller.formKeyDadosUsuario,
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: TextEditingController(text: controller.dadosPessoaisEditar.dataNascimento.toString()),
                      keyboardType: TextInputType.none,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Preencha este campo!";
                        }
                        return null;
                      },
                      onTap: () async {
                        mostrarCalendario();
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: -_size.width * 0.05),
                        labelText: "Data de nascimento",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range_rounded,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20.0),
                    child: InputTextoWidget(
                      labelInput: "Em que cidade você mora?",
                      entradaController: TextEditingController(text: controller.dadosPessoaisEditar.cidade),
                      entradaTipo: TextInputType.name,
                      mostrarSenha: false,
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20.0),
                    child: InputTextoWidget(
                      labelInput: "Você estudou por quantos anos?",
                      entradaController: TextEditingController(text: controller.dadosPessoaisEditar.tempoEstudo.toString()),
                      entradaTipo: TextInputType.number,
                      mostrarSenha: false,
                      prefixIcon: Icons.airline_seat_recline_normal_sharp,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: TextEditingController(text: controller.dadosPessoaisEditar.altura.toString()),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: -_size.width * 0.05),
                              labelText: "Altura(m)",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              prefixIcon: const Icon(Icons.info),
                            ),
                            inputFormatters: [
                              Mask.generic(masks: ["#,##"])
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.025),
                            child: SizedBox(
                              width: _size.width * 0.42,
                              child: InputTextoWidget(
                                labelInput: "Peso(kg)",
                                entradaController:TextEditingController(text: controller.dadosPessoaisEditar.peso.toString()),
                                entradaTipo: TextInputType.number,
                                mostrarSenha: false,
                                prefixIcon: Icons.info,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    "Você pratica alguma atividade física?",
                    style: TextStyle(
                      color: CoresMovedor.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                              CadastroController.instance.atividadeFisicaEditar.ativ_fisica_nao_pratica = false;
                            }
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_caminhar = CadastroController.instance.listaAtividades[0].check;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_correr = CadastroController.instance.listaAtividades[1].check;;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_dancar = CadastroController.instance.listaAtividades[2].check;;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_nadar = CadastroController.instance.listaAtividades[3].check;;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_academia = CadastroController.instance.listaAtividades[4].check;;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_outras = CadastroController.instance.listaAtividades[5].check;;
                          CadastroController.instance.atividadeFisicaEditar.ativ_fisica_nao_pratica = CadastroController.instance.listaAtividades[6].check;;                        
                          }
                        );
                      },
                    )).toList(),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ButtomWidget(
                            texto: "Continuar",
                            onPress:(){
                              showDialogConclusion(
                                context,
                                '',
                                'Atualização concluida',
                                popShowDialog,
                              );
                            },
                            textColor: CoresMovedor.textoBotaoCor,
                            botaoColor: CoresMovedor.primary,
                            habilitarBotao: true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  popShowDialog() {
    Navigator.of(context).pop();
  }

  popShowDialogConclusion() {
    FocusScope.of(context).unfocus();
    controller.criarConta(context);
  }

  Future<dynamic> showDialogConclusion(BuildContext context, String title,
      String content, Function() func) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleMovedor.secondTextStyleAzul,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            ButtomWidget(
                texto: "Continuar",
                onPress: func,
                textColor: CoresMovedor.textoBotaoCor,
                botaoColor: CoresMovedor.primary,
                habilitarBotao: true),
          ],
        ),
        actions: [],
      ),
    );
  }
  void mostrarCalendario() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (data != null) {
      List<String> dataPt = data.toString().split(" ");
      List<String> dataConvert = dataPt[0].split("-");

      setState(() {
        yearChosen = int.parse(dataConvert[0]);
        yearCurrent = int.parse(DateTime.now().year.toString());
        age = (yearCurrent - yearChosen);
      });
      if (age >= 18) {
        setState(() {
          controller.dadosPessoaisEditar.dataNascimento =
              dataConvert[2] + "/" + dataConvert[1] + "/" + dataConvert[0];

          yearChosen = int.parse(dataConvert[0]);
          yearCurrent = int.parse(DateTime.now().year.toString());
          age = yearCurrent - yearChosen;
        });
      } else {
        showSnackBar();
      }
    }
  }

  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(label: "Ok", onPressed: () {}),
        duration: const Duration(seconds: 5),
        content: const Text(
          'Você tem que ter pelo menos 18 anos para usar o Aplicativo!',
        ),
      ),
    );
  }
}
class AtividadeFisicaCheckbox {
  String nome;
  bool check;

  AtividadeFisicaCheckbox(this.nome, this.check);
}


