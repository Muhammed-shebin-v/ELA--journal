import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomHomeLinearIndicator extends StatelessWidget {
  final String title;
  final double value;

  const CustomHomeLinearIndicator({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(30)),
          child: LinearProgressIndicator(
            backgroundColor: ElaColors.white,
            color: ElaColors.green,
            minHeight: 20,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            value: value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style:ElaTextStyle.small,
          ),
        )
      ],
    );
  }
}
