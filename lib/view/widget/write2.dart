import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/title.dart';
import 'container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomWrite2 extends StatelessWidget {
  final String title;
  final double titlelength;
  final String subtitle;
  final String image;
  final dynamic location;
  const CustomWrite2(
      {super.key,
      required this.title,
      required this.titlelength,
      required this.subtitle,
      required this.image,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => location));
        },
        child: CustomContainer(
          boxshadow: true,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: Image(
                        width: 115, height: 115, image: AssetImage(image))),
                Flexible(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTitle(
                          alighnment: Alignment.topRight,
                          heading: title,
                          length: titlelength,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        subtitle,
                        style: ElaTextStyle.smallSubTitle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
