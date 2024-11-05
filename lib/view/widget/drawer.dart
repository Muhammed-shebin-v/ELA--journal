import 'package:new_ela/view/user_edit.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/about.dart';
import 'package:new_ela/view/widget/drawer_item.dart';
import 'package:new_ela/view/widget/legal_terms.dart';
import 'package:new_ela/view/widget/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  final dynamic context;
  const CustomDrawer({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(150),
            Stack(
              children: [Text('ELA', style: GoogleFonts.kalnia(fontSize: 50))],
            ),
            const Gap(20),
            const DrawerItem(text: 'Edit Details', screen: UserEdit()),
            InkWell(
              onTap: () {
                elaaboutDialog(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About',
                    style: ElaTextStyle.title,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            const DrawerItem(text: 'Privacy Policy', screen: PrivacyPolicy()),
            const DrawerItem(text: 'Legal Terms', screen: LegalTerms()),
            const Gap(350),
            const Align(
              child: Text(
                'Version-2.0.1',
                style: ElaTextStyle.title,
              ),
            )
          ],
        ),
      ),
    );
  }
}
