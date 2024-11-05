import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/title.dart';

import 'container.dart';
import 'package:flutter/material.dart';

class CustomDialyGoals extends StatefulWidget {
  final String title;
  final String subtitle;
  final double titlelength;
  final String  unit;
  final dynamic increasefunction;
  final dynamic decreasefunction;
  final dynamic currentIntake;
  final dynamic dialyGoal;

  const CustomDialyGoals(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.titlelength,
      required this.unit,
      required this.increasefunction,
      required this.decreasefunction,
      required this.currentIntake,
      required this.dialyGoal});

  @override
  State<CustomDialyGoals> createState() => _CustomDialyGoalsState();
}

class _CustomDialyGoalsState extends State<CustomDialyGoals> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      boxshadow: true,
      color: ElaColors.lightgrey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            CustomTitle(
              heading: widget.title,
              length: widget.titlelength,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(widget.subtitle,
                    style: const TextStyle(fontSize: 15))),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: widget.decreasefunction,
                    icon: const Icon(Icons.remove),
                    iconSize: 20,
                  ),
                  Text(
                      '${widget.currentIntake.toStringAsFixed(0)} ${widget.unit}'),
                  IconButton(
                    onPressed: widget.increasefunction,
                    icon: const Icon(Icons.add),
                    iconSize: 20,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)),
              child: LinearProgressIndicator(
                minHeight: 15,
                borderRadius: BorderRadius.circular(30),
                backgroundColor: Colors.white,
                color: const Color.fromRGBO(194, 246, 58, 1),
                value: widget.currentIntake / widget.dialyGoal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
