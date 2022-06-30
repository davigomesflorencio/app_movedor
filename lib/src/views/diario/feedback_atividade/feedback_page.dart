import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/controllers/historico_atividades_controller.dart';
import 'package:aplicacao/src/models/atividades.dart';
import 'package:aplicacao/src/models/historico_atividades.dart';
import 'package:aplicacao/src/util/helpers_date.dart';
import 'package:aplicacao/src/util/helpers_dialog.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:aplicacao/src/views/diario/widgets/pending_activity_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../components/atividade.dart';
import '../components/historico.dart';
import '../components/motivos.dart';
import '../components/motivos_ext.dart';
import '../widgets/activity_history_card.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key}) : super(key: key);

  final List<Image> images = [
    for (int i = 0; i < 11; i++) Image.asset('assets/borg/${i}.png')
  ];
  final List<String> labels = [
    "Repouso",
    "Demasiado leve",
    "Muito leve",
    "Muito leve-leve",
    "Leve",
    "Leve-Moderado",
    "Moderado",
    "Moderado-Intenso",
    "Intenso",
    "Muito intenso",
    "Exaustivo",
  ];
  final List<Color?> colors = [
    Colors.yellow,
    Colors.yellow[600],
    Colors.yellow[700],
    Colors.yellow[900],
    Colors.red,
  ];

  String getLabel(String esforco) {
    return labels.firstWhere((element) => element == esforco);
  }

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  AtividadesController _atividadesController = Get.find();
  HistoricoAtividadesController _historicoAtividadesController = Get.find();

  late List<Atividade> scheduled = List.empty(growable: true);

  late RxList<Historico> answered = RxList.empty(growable: true);

  late RxList<Historico> pendding = RxList.empty(growable: true);

  late double tempoAtividade = 10;

  void getAtividadesPendentes() {
    pendding.value = List.empty(growable: true);
    scheduled = List.empty(growable: true);
    for (Atividades x in _atividadesController.atividades) {
      scheduled.add(
        Atividade(
          id: x.reference!.id,
          tipo: x.tipo_atividade!,
          dias: x.getDays(),
          inicio: TimeOfDay(
            hour: int.parse(
                HelpersDate.convertStringToListDuration(x.hora_inicio!)[0]),
            minute: int.parse(
                HelpersDate.convertStringToListDuration(x.hora_inicio!)[1]),
          ),
          dur: Duration(minutes: int.parse(x.duracao!)),
        ),
      );
    }
    for (final e in scheduled) {
      for (final dia in e.dias) {
        DateTime curDataTime = DateTime.now();
        DateTime curData = DateFormat('dd/MM/yyyy').parse(
          DateFormat('dd/MM/yyyy').format(curDataTime),
        );
        DateTime data;

        Duration delta = Duration(
          days: ((curDataTime.weekday - (dia.index + 1)).toInt()) % 7,
        );

        data = curData.subtract(delta);
        data = data.add(Duration(
          hours: e.inicio.hour,
          minutes: e.inicio.minute,
        ));

        Historico entry = Historico(
          id: e.id,
          data: data,
          tipo: e.tipo,
          dur: e.dur,
          fez: null,
          esforco: -1,
          motivo: null,
          initHour: HelpersDate.formatDuration(
            HelpersDate.convertStringToDuration(
              e.inicio.hour.toString() + ":" + e.inicio.minute.toString(),
            ),
          ),
          reference: null,
        );

        if (!answered.map((e) => entry.isEquals(e)).contains(true) ||
            answered.isEmpty) {
          pendding.add(entry);
        }
      }
    }
  }

  Future<void> getHistoricoDeAtividades() async {
    answered.value = List.empty(growable: true);
    _historicoAtividadesController.buscarHistoricoAtividades().then((_) {
      for (HistoricoAtividades x
          in _historicoAtividadesController.historicoAtividades) {
        Atividades? atv =
            _atividadesController.getAtividadePorId(x.id_atividade!);
        if (atv != null) {
          Historico entry = Historico(
            id: x.id_atividade!,
            data: HelpersDate.convertStringDateToDateTime(x.data_atividade!, 0),
            tipo: atv.tipo_atividade!,
            dur: HelpersDate.convertStringToDuration(atv.duracao!),
            fez: x.fez,
            esforco: x.esforco == "" ? -1 : 1,
            motivo: MotivosParse.fromString(x.motivo!),
            archivedActivity: false,
            initHour: atv.hora_inicio,
            reference: x.reference,
          );
          DateTime dateActivity =
              HelpersDate.convertStringDateToDateTime(x.data_atividade!, 0);
          DateTime lastDate = HelpersDate.convertMinusStringDateToDateTime(
              HelpersDate.getStringDateNow(), 7);

          if (!answered.map((e) => e.isEquals(entry)).contains(true)) {
            if (dateActivity.compareTo(lastDate) > 0) {
              entry.archivedActivity = true;
            }
            answered.add(entry);
          }
        }
      }
      getAtividadesPendentes();
    });
  }

  @override
  void initState() {
    super.initState();
    getHistoricoDeAtividades();
  }

  @override
  void didChangeDependencies() {
    for (var img in widget.images) {
      precacheImage(img.image, context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atividades',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Atividades Pendentes',
                // textScaleFactor: 1.5,
                style: TextStyleMovedor.secondaryBoldTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Obx(() {
                return Visibility(
                  // visible: pendingItemCount > 0,
                  visible: pendding.length > 0,
                  replacement: Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    alignment: Alignment.center,
                    child: Text(
                      'Sem atividades',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: pendingBuilder,
                    separatorBuilder: separatorBuilder,
                    // itemCount: pendingItemCount,
                    itemCount: pendding.length,
                  ),
                );
              }),
              const Divider(
                height: 50,
                thickness: 1,
                color: Colors.black,
              ),
              const Text(
                'Histórico',
                style: TextStyleMovedor.secondaryBoldTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Obx(() {
                return Visibility(
                  // visible: historyItemCount > 0,
                  visible: answered.length > 0,
                  replacement: Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    alignment: Alignment.center,
                    child: Text(
                      'Sem histórico',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: historyBuilder,
                    separatorBuilder: separatorBuilder,
                    // itemCount: historyItemCount,
                    itemCount: answered.length,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Divider separatorBuilder(BuildContext context, int index) {
    return const Divider();
  }

  Widget pendingBuilder(BuildContext context, int index) {
    final dateFormatter = DateFormat('dd/MM/yyyy');
    String data = dateFormatter.format(pendding[index].data);
    String time = HelpersDate.formatDuration(pendding[index].dur);

    String type = pendding[index].tipo;
    String weekday = HelpersDate.convertStringDateToDateTime(
      HelpersDate.converDateTimeToString(pendding[index].data),
      0,
    ).weekday.toString();
    bool? done = null;

    return PendingActivityCard(
        data: data,
        time: time,
        type: type,
        weekday: HelpersDate.getDia(weekday),
        done: done,
        initHour: pendding[index].initHour,
        onChanged: () async {
          Motivos? motivo;
          int? esforco = -1;
          bool res = await wasActivityDone(context);

          if (res) {
            esforco = await effortToFinishActivity(context);
            pendding[index].esforco = esforco;

            _historicoAtividadesController.criarHistoricoAtividade(
              pendding[index].id,
              res,
              "",
              esforco,
              tempoAtividade,
              HelpersDate.converDateTimeToString(pendding[index].data),
            );
          } else {
            motivo = await whyActivityWasNotDone(context);
            pendding[index].motivo = motivo;

            await motivosFeedback(context, motivo);

            _historicoAtividadesController.criarHistoricoAtividade(
              pendding[index].id,
              res,
              motivo!.parseToString(),
              -1,
              tempoAtividade,
              HelpersDate.converDateTimeToString(pendding[index].data),
            );
          }

          pendding.removeAt(index);
          getHistoricoDeAtividades();
          tempoAtividade = 10;
          setState(() {});
        });
  }

  Widget historyBuilder(BuildContext context, int index) {
    final dateFormatter = DateFormat('dd/MM/yyyy');
    String data = dateFormatter.format(answered[index].data);
    String time = HelpersDate.formatDuration(answered[index].dur);
    String type = answered[index].tipo;
    String weekday = HelpersDate.convertStringDateToDateTime(
      HelpersDate.converDateTimeToString(answered[index].data),
      0,
    ).weekday.toString();
    bool? done = answered[index].fez;

    return ActivityHistoryCard(
        data: data,
        time: time,
        type: type,
        weekday: HelpersDate.getDia(weekday),
        done: done,
        archivedActivity: answered[index].archivedActivity,
        initHour: answered[index].initHour,
        onChanged: () async {
          if (await removeActivityFromHistoryConfirmation(context)) {
            if (!pendding
                .map((e) => answered[index].isEquals(e))
                .contains(true)) {
              if (answered[index].reference != null) {
                answered[index].fez = null;
                pendding.add(answered[index]);
                DocumentReference ref = answered[index].reference!;
                await ref.delete();
                answered.removeAt(index);
              } else {
                HelpersDialog.showDialogConclusion(
                  context,
                  "Aviso",
                  "Não foi possível remover atividade do Histórico! Tente novamente!",
                  "OK",
                  () => Navigator.pop(context),
                );
              }
            }
          }
          setState(() {});
        });
  }

  Future<bool> wasActivityDone(BuildContext ctx) async {
    bool done = false;
    await showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (context) {
          final noBtn = TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'));
          final yesBtn = ElevatedButton(
              onPressed: () {
                done = true;
                Navigator.of(context).pop();
              },
              child: Text('Sim'));
          return AlertDialog(
            content: Text('Você realizou essa atividade?'),
            actionsAlignment: MainAxisAlignment.end,
            actions: [
              Row(
                children: [
                  Expanded(child: noBtn),
                  Expanded(child: yesBtn),
                ],
              ),
            ],
          );
        });
    return done;
  }

  Future<void> motivosFeedback(BuildContext context, Motivos? motivo) async {
    if (motivo == null || motivo == Motivos.motivo11) return;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: motivo.feedback(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Entendido'),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<Motivos?> whyActivityWasNotDone(BuildContext ctx) async {
    Motivos? motivo_res;

    await showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (_) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Por qual motivo você não conseguiu realizar essa atividade?',
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < Motivos.values.length; i++)
                      RadioListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(Motivos.values[i].parseToString()),
                          value: Motivos.values[i],
                          groupValue: motivo_res,
                          onChanged: (Motivos? motivo) {
                            setState(() {
                              motivo_res = motivo;
                            });
                          })
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirmar')),
                    ),
                  ],
                )
              ],
            );
          });
        });

    return motivo_res;
  }

  Future<bool> removeActivityFromHistoryConfirmation(BuildContext ctx) async {
    bool canRemove = false;
    await showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (context) {
          var noBtn = TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'));
          var yesBtn = Expanded(
            child: ElevatedButton(
                onPressed: () {
                  canRemove = true;
                  Navigator.of(context).pop();
                },
                child: Text('Sim')),
          );
          return AlertDialog(
            content: Text('Você deseja remover essa atividade do histórico?'),
            actionsAlignment: MainAxisAlignment.end,
            actions: [
              Row(
                children: [Expanded(child: noBtn), Expanded(child: yesBtn)],
              )
            ],
          );
        });

    return canRemove;
  }

  Future<int> effortToFinishActivity(BuildContext ctx) async {
    double effort = 0.0;

    await showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (_) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              // title: Text(''),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Quanto tempo você levou para realizar essa atividade?",
                      style: TextStyleMovedor.thirdTextStyleAzul,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Slider(
                        value: tempoAtividade,
                        max: 60.0,
                        min: 10.0,
                        divisions: 10,
                        label: "${tempoAtividade.toInt()}",
                        onChanged: (double value) {
                          setState(() {
                            tempoAtividade = value;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10 a 25 minutos",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "60 minutos",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Qual o nível de esforço que você fez para realizar '
                      'essa atividade?',
                      style: TextStyleMovedor.thirdTextStyleAzul,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 200,
                      ),
                      padding: EdgeInsets.all(32),
                      child: widget.images[effort.toInt()],
                    ),
                    Center(
                      child: Text(widget.labels[effort.toInt()]),
                    ),
                    Slider(
                      value: effort,
                      divisions: 10,
                      min: 0,
                      max: 10,
                      activeColor: widget.colors[effort.toInt() <= 2
                          ? 0
                          : effort.toInt() <= 4
                              ? 1
                              : effort.toInt() <= 6
                                  ? 2
                                  : effort.toInt() <= 8
                                      ? 3
                                      : 4],
                      onChanged: (double val) {
                        setState(() {
                          effort = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirmar')),
                    ),
                  ],
                )
              ],
            );
          });
        });

    return effort.toInt();
  }
}
