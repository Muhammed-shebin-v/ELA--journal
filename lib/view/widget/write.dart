import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/title.dart';
import 'container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomWite extends StatelessWidget {
  final String title;
  final double titlelength;
  final String subtitle;
  final String image;
  final dynamic location;

  const CustomWite(
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => location));
      },
      child: CustomContainer(
        boxshadow: true,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                        heading: title, length: titlelength),
                    const Gap(20),
                        Text(subtitle,
                          style:ElaTextStyle.smallSubTitle,
                          ),
                  ],
                ),
              ),
              
              Flexible(
                flex: 3,
                child: Image(width: 115, height: 115, image: AssetImage(image)))
            ],
          ),
        ),
      ),
    );
  }
}
