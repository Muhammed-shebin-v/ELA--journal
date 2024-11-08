import 'package:gap/gap.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class LegalTerms extends StatelessWidget {
  const LegalTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElaColors.white,
        appBar: AppBar(
            title: const Text(
          'Terms and Conditions',
          style: ElaTextStyle.heading,
        ),
        backgroundColor: ElaColors.white,),
        body:   SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
Text('''Effective Date:08/11/2024

Welcome to ELA 
These terms and conditions "Terms" govern your use of ELA , a privacy-focused diary and personal management application''',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('Acceptance of Terms',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text('By downloading, accessing, or using the ELA Application, You agree to be bound by these Terms of Service. If You do not agree with any part of these Terms, you may  not use the Application.',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('User Responsibilities ',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text(''' - You are responsible for maintaining the confidentiality of your account information,the datas are storing inside your device you have the full responsibility.
 - You agree not to use ELA for any illegal or unathorized purpose.
''',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('Data and Content',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text('''- You retain ownership of the data and content you add to ELA.
- we dont collect,use or share your data for anything and anyone''',style: ElaTextStyle.subTitle,),
 const Gap(10),
 const Text('Prohibited Activities',style: ElaTextStyle.privacyheading,),
 const Gap(10),
 Text(''' - You agree not to engage in any of the following prohibited activities:
 - Violating any applicable laws or regulations.
 - Uploading malicious code or engaging in harmful acativities.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('Termination',style: ElaTextStyle.privacyheading,),
 const Gap(10),
Text('We reserve the right to terminate or suspend your account immediately,without prior notice or liability , for any reason whatsoever, including without limitation if you breach these Terms.',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('Security Measures',style: ElaTextStyle.privacyheading,),
 const Gap(10),
  Text(''' - The Application uses local storage to store all user data securely .
- ELA do not transmit or share user data with any third-party services or external entities.
- Only user have access to the data stored within the Application on Your Device.
- Our Application is child-friendly and safe for all users,there is no risk as the content is non-harmful and suitable for all ages.
- We do not collect financial data or any sensitive personal information.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('Changes to Terms',style: ElaTextStyle.privacyheading,),
 const Gap(10),
   Text('We reserve the right to modify these Terms of Service at any time.We may update these Terms at any time without notice, it is your responsibiliy to review these Terms periodically',style: ElaTextStyle.subTitle,),
   const Gap(10),
    const Text('Contact Information',style: ElaTextStyle.privacyheading,),
    const Gap(10),
  Text('If You have any questions regarding these Terms of Service, please contact Us at:',style: ElaTextStyle.subTitle,),
  const Text('''Email: vakkayilshebin07@gmail.com'''),
  const Gap(20),
 const Text('Thank you for using ELA',style: ElaTextStyle.privacyheading,),
                  ],
                )
              ),
          )
          ),
      );
    }
}