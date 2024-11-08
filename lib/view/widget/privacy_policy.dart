import 'package:gap/gap.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElaColors.white,
        appBar: AppBar(
            title: const Text(
          'Privacy Policy',style: ElaTextStyle.subHeading,
        ),
        backgroundColor: ElaColors.white,),
        body:  SafeArea(
          child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
const Text('Effective Date: 08/11/2024',textAlign: TextAlign.center,),
const Gap(10),
const Text('Welcome to ELA,',textAlign: TextAlign.center,style: ElaTextStyle.title,),
const Gap(10),
const Text('This Privacy Policy outlines how we handles user data when you use our app.',textAlign: TextAlign.center,),
const Gap(30),
const Text('Data Storage or Informations We Collect',style: ElaTextStyle.subHeading,textAlign: TextAlign.center,),
const Gap(10),
const Text('ELA stores all user-provided informations,including but not limited to name,phone number,address,date of birth,profile picture,locally on your device.This local storage is utilized to enhance your user experience within the app and is solely accessible within the app on your device.',textAlign: TextAlign.center,),
const Gap(30),
const Text('Data Security',style: ElaTextStyle.subHeading,textAlign: TextAlign.center,),
const Gap(10),
const Text('We prioritize the security of all locally stored user information.While this data is stored on your device,  ELA implements measure to protect it from unauthorized access.',textAlign: TextAlign.center,),
const Gap(30),
const Text('Changes to the Privacy Policy',style: ElaTextStyle.subHeading,textAlign: TextAlign.center,),
const Gap(10),
const Text('We reserve the right to update or change our Privacy Policy at any time.We will notify you of any changes by posting the new Privacy Policy on this page'),
const Gap(30),
const Text('Contact Us',style: ElaTextStyle.subHeading,textAlign: TextAlign.center,),
const Gap(10),
const Text('If you have any questions or concerns about this Privacy Policy.Please contact us at:',textAlign: TextAlign.center,),
Text('vakkayilshebin07@gmail.com',style: ElaTextStyle.subTitle,textAlign: TextAlign.center,),
                    ],
                  
                  ),
                )),
          ),
        );
  }
}
