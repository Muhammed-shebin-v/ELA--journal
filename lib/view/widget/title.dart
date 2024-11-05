import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/cupertino.dart';

class CustomTitle extends StatelessWidget {
  final String heading;
  final double length;
  final dynamic alighnment;

  const CustomTitle(
      {super.key,
      required this.heading,
      required this.length,
      this.alighnment=Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alighnment,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 26,
              width: length,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 255, 210, 1),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:6.0,left: 2),
            child: Text(heading, style: ElaTextStyle.title),
          ),
        ]));
  }
}