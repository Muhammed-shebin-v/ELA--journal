import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/cupertino.dart';

class CustomHeading extends StatelessWidget {
  final String heading;
  final double length;
  final dynamic alighnment;

  const CustomHeading(
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
              height: 30,
              width: length,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 255, 210, 1),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Text(heading, style: ElaTextStyle.heading),
        ]));
  }
}
