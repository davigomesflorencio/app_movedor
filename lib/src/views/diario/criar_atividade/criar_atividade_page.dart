import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/util/helpers_dialog.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarAtividadePage extends StatefulWidget {
  const CriarAtividadePage({Key? key}) : super(key: key);

  @override
  State<CriarAtividadePage> createState() => _CriarAtividadePage();
}

class _CriarAtividadePage extends State<CriarAtividadePage> {
  AtividadesController atividadesController = Get.find();

  _CriarAtividadePage() {}

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    TimeOfDay _time = TimeOfDay.now().replacing(hour: 2, minute: 30);

    void onTimeChanged(TimeOfDay newTime) {
      setState(() {
        _time = newTime;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diário de atividade',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: _size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Escolha a categoria do exercício',
                      textAlign: TextAlign.justify,
                      style: TextStyleMovedor.secondTextStyleAzul,
                    ),
                    SizedBox(
                      height: _size.height * 0.02,
                    ),
                    DropdownButtonFormField(
                        items: atividadesController.items,
                        value: atividadesController.selectedValue,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          setState(() {
                            atividadesController.atividadeSelecionada =
                                value.toString();
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  'Escolha os dias da semana para realizar essa atividade:',
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondTextStyleAzul,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [Dias()],
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  "Escolha o horario que pretende realizar o exercício:",
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondTextStyleAzul,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: MinuteInterval.FIVE,
                        is24HrFormat: true,
                        cancelText: 'Cancelar',
                        okText: 'OK',
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          atividadesController.hrInicio = dateTime.hour;
                          atividadesController.minInicio = dateTime.minute;
                          atividadesController.textTimeInicial =
                              atividadesController.hrInicio.toString() +
                                  ":" +
                                  atividadesController.minInicio.toString();
                        },
                      ),
                    );
                  },
                  child: Text(
                    atividadesController.textTimeInicial,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  "Escolha o tempo de duração do exercício:",
                  textAlign: TextAlign.justify,
                  style: TextStyleMovedor.secondTextStyleAzul,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "10 a 25 minutos",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "60 minutos",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Slider(
                    value: atividadesController.tempoAtividade,
                    max: 60.0,
                    min: 10.0,
                    divisions: 10,
                    label: "${atividadesController.tempoAtividade.toInt()}",
                    onChanged: (double value) {
                      setState(() {
                        atividadesController.tempoAtividade = value;
                      });
                    }),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                SizedBox(
                  width: _size.width,
                  child: ButtomWidget(
                    botaoColor: CoresMovedor.primary,
                    habilitarBotao: true,
                    onPress: () {
                      if (atividadesController.valoresDias.contains(true)) {
                        if ((atividadesController.minInicio <= 59 &&
                                atividadesController.minInicio >= 0) &&
                            (atividadesController.hrInicio >= 0 &&
                                atividadesController.hrInicio <= 23)) {
                          atividadesController.salvarAtividade();
                          HelpersDialog.showDialogConclusion(
                            context,
                            "Atividade criada",
                            "Sua atividade foi criada com sucesso!",
                            "OK",
                            () {
                              atividadesController.buscarAtividadesDoUsuario();

                              Navigator.of(context).pop();
                              Get.back();
                            },
                          );
                          setState(() {
                            atividadesController.limparValoresDoController();
                          });
                        } else {
                          HelpersDialog.watchShowDialog(
                            context,
                            'Horário final inválido',
                          );
                        }
                      } else {
                        HelpersDialog.watchShowDialog(
                          context,
                          'Escolha pelo menos um dia!',
                        );
                      }
                    },
                    textColor: Colors.white,
                    texto: 'Criar atividade',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton createFloatingactionButton(String text, int index) {
    return FloatingActionButton.small(
      heroTag: null,
      backgroundColor: atividadesController.btmColors[index],
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        setState(() {
          if (atividadesController.btmColors[index] ==
              atividadesController.btmColorOn) {
            atividadesController.btmColors[index] = Colors.grey;
            atividadesController.valoresDias[index] = false;
          } else {
            atividadesController.btmColors[index] =
                atividadesController.btmColorOn;
            atividadesController.valoresDias[index] = true;
          }
        });
      },
      shape: new CircleBorder(),
      elevation: 0.0,
    );
  }

  Widget Dias() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          createFloatingactionButton('DOM', 0),
          createFloatingactionButton('SEG', 1),
          createFloatingactionButton('TER', 2),
          createFloatingactionButton('QUA', 3),
          createFloatingactionButton('QUI', 4),
          createFloatingactionButton('SEX', 5),
          createFloatingactionButton('SAB', 6),
        ],
      ),
    );
    ;
  }
}
