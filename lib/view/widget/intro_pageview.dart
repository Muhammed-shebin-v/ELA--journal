import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomIntroPageView extends StatelessWidget {
  final String image;
  final String subtitle;
  const CustomIntroPageView(
      {super.key, required this.image, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: CustomContainer(
        color: ElaColors.white,
        boxshadow: true,
        child: Column(
          children: [
            const Gap(50),
            SizedBox(
              child: Image(width: 300, image: AssetImage(image)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
