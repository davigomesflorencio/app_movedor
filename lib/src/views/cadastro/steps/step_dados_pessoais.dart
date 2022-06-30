import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/views/components/input_text.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';

class StepDadosPessoais extends StatefulWidget {
  const StepDadosPessoais({
    Key? key,
  }) : super(key: key);

  @override
  State<StepDadosPessoais> createState() => _StepDadosPessoaisState();
}

class _StepDadosPessoaisState extends State<StepDadosPessoais> {
  int yearChosen = 0;
  int yearCurrent = 0;
  int age = 0;

  var controller = CadastroController.instance;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Form(
      key: controller.formKeyDadosUsuario,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextFormField(
              controller: CadastroController.instance.dataNascimentoController,
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
          InputTextoWidget(
            labelInput: "Em que cidade você mora?",
            entradaController: CadastroController.instance.cidadeController,
            entradaTipo: TextInputType.name,
            mostrarSenha: false,
            prefixIcon: Icons.location_on_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: InputTextoWidget(
              labelInput: "Você estudou por quantos anos?",
              entradaController:
                  CadastroController.instance.tempoEstudoController,
              entradaTipo: TextInputType.number,
              mostrarSenha: false,
              prefixIcon: Icons.airline_seat_recline_normal_sharp,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: CadastroController.instance.alturaController,
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
              Flexible(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: _size.width * 0.025),
                    child: SizedBox(
                      width: _size.width * 0.42,
                      child: InputTextoWidget(
                        labelInput: "Peso(kg)",
                        entradaController:
                            CadastroController.instance.pesoController,
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
          CadastroController.instance.dataNascimentoController.text =
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
