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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Text('''Last Updated: [6-11-2024]

Welcome to ELA ("App", "Service", "we", "our", "us"). These Terms and Conditions govern your use of our application and services. By accessing or using [App Name], you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not access the App.''',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('1. Acceptance of Terms',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text('By accessing or using ELA, you agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree to all the terms, please do not use our App.',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('2. Eligibility',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text('To use ELA, you must be at least 1 years old. By agreeing to these Terms, you represent and warrant that you meet this age requirement.',style: ElaTextStyle.subTitle,),
const Gap(10),
const Text('3. Account Registration and Security',style: ElaTextStyle.privacyheading,),
const Gap(10),
Text(''' * You may need to create an account to access certain features of the App.
 * You are responsible for maintaining the confidentiality of your account and password.
 * You agree to notify us immediately of any unauthorized use of your account.''',style: ElaTextStyle.subTitle,),
 const Gap(10),
 const Text('4. Use of the App',style: ElaTextStyle.privacyheading,),
 const Gap(10),
 Text('''You agree to use the App only for lawful purposes.
You will not misuse the App, including but not limited to distributing viruses or other harmful code, conducting unauthorized access, or using the App in a manner that could harm us or third parties.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('5. User Content',style: ElaTextStyle.privacyheading,),
 const Gap(10),
  Text('''You are responsible for any content you upload, post, or otherwise make available through the App ("User Content").
You grant us a non-exclusive, royalty-free, transferable license to use, reproduce, modify, and display your User Content in connection with the App.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('6. Privacy Policy',style: ElaTextStyle.privacyheading,),
 const Gap(10),
  Text('''Your privacy is important to us. Our Privacy Policy describes how we collect, use, and disclose information. By using ELA, you agree to the terms of our Privacy Policy and consent to the collection, use, and sharing of your information as described in it.''',style: ElaTextStyle.subTitle,),
  const Gap(10),
 const Text('7. Intellectual Property',style: ElaTextStyle.privacyheading,),
 const Gap(10),
  Text('''All content, trademarks, and data on the App, including but not limited to software, graphics, text, images, logos, and trademarks, are our property or the property of our licensors and are protected by intellectual property laws.
You may not use our intellectual property for any purpose without our prior written permission.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('8. Termination',style: ElaTextStyle.privacyheading,),
 const Gap(10),
   Text('''We reserve the right to terminate or suspend your account at our discretion, without notice, if you violate these Terms and Conditions.
Upon termination, your right to use the App will cease immediately.''',style: ElaTextStyle.subTitle,),
const Gap(10),
    const Text('9. Limitation of Liability',style: ElaTextStyle.privacyheading,),
    const Gap(10),
  Text('''ELA and its directors, employees, partners, and agents shall not be liable for any indirect, incidental, or punitive damages arising out of your use or inability to use the App.
In no event shall our liability exceed the amount you paid, if any, to use the App.''',style: ElaTextStyle.subTitle,),
const Gap(10),
 const Text('10. Indemnification',style: ElaTextStyle.privacyheading,),
 const Gap(10),
   Text('''You agree to indemnify, defend, and hold us harmless from any claims, damages, losses, or expenses  arising from your use of the App or your violation of these Terms and Conditions.''',style: ElaTextStyle.subTitle,),
   const Gap(10),
    const Text('11. Changes to Terms',style: ElaTextStyle.privacyheading,),
    const Gap(10),
  Text('''We may update these Terms and Conditions from time to time. We will notify you of any changes by posting the new Terms and Conditions on this page. You are advised to review these Terms periodically for any changes. Your continued use of the App following the posting of changes constitutes your acceptance of those changes.''',style: ElaTextStyle.subTitle,),
  const Gap(10),
 const Text('12. Governing Law',style: ElaTextStyle.privacyheading,),
 const Gap(10),
   Text('''These Terms and Conditions are governed by the laws of . Any disputes arising from these Terms or the use of the App will be resolved in the courts of [Jurisdiction].''',style: ElaTextStyle.subTitle,),
   const Gap(10),
    const Text('13. Contact Us',style: ElaTextStyle.privacyheading,),
    const Gap(10),
   Text('''If you have any questions about these Terms and Conditions, please contact us at:

Email: vakkayilshebin07@gmail.com''',style: ElaTextStyle.subTitle,),
 
                  ],
                )
              ),
          )
          ),
      );
    }
}