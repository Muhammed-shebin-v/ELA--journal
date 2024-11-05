import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final screen;
  const DrawerItem({super.key, required this.text,this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: ElaTextStyle.title,
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
