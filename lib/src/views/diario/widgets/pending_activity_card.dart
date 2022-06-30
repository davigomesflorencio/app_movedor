import 'package:flutter/material.dart';

import '../../components/colors.dart';

class PendingActivityCard extends StatelessWidget {
  final String data;
  final String time;
  final String type;
  final String weekday;
  final bool? done;

  final String? initHour;
  final Function() onChanged;

  PendingActivityCard(
      {Key? key,
      required this.data,
      required this.time,
      required this.type,
      required this.weekday,
      required this.done,
      required this.onChanged,
      required this.initHour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (done == null) {
      icon = Icons.pending_actions;
    } else if (done == true) {
      icon = Icons.done;
    } else {
      icon = Icons.not_interested;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: done == null
            ? Colors.black.withOpacity(0.02)
            : Colors.black.withOpacity(0.1),
      ),
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: done == null,
            child: Container(
              decoration: const BoxDecoration(
                color: CoresMovedor.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              constraints: const BoxConstraints(
                minHeight: 80,
              ),
              width: 8,
            ),
            replacement: SizedBox(),
          ),
          Flexible(
            flex: 1,
            child: Icon(
              icon,
              color: done != null
                  ? done == true
                      ? Colors.green
                      : Colors.red
                  : Colors.grey.shade700,
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          type,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Data : " + data + " (" + weekday + ")"),
                            Text("Hora de início : " + initHour!),
                            Text("Duração : " + time),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                splashColor: CoresMovedor.primary,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onTap: () {
                  onChanged();
                },
                child: Card(
                  color: Colors.black.withOpacity(0.01),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
