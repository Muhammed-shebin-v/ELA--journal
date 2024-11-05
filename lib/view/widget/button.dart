import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  bool? button=false;
  final double? width;
  CustomButton({super.key,required this.text,this.button,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(194, 246, 58, 1),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: ElaTextStyle.title,
            ),
            button==true?
               const Icon(Icons.add):
               const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
