import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class LegalTerms extends StatelessWidget {
  const LegalTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Legal Terms and Conditions for ELA',
        ),
        backgroundColor: ElaColors.white,),
        body: const SingleChildScrollView(
          child: SafeArea(
              child: Flexible(child: Text('''Effective Date: [22-10-2024]

These Terms and Conditions ("Terms") govern your use of the ELA mobile application (the "App"). By downloading, installing, or using the App, you agree to these Terms. If you do not agree with any part of these Terms, you must not use the App.

1. Acceptance of Terms
By accessing or using the App, you confirm that you accept these Terms and agree to comply with them. If you do not agree with these Terms, you must not use the App.

2. User Account
To access certain features of the App, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.

3. User Content
You are solely responsible for any content you create, upload, or share through the App, including diary entries, bucket lists, to-do lists, daily goals, and daily moods ("User Content"). You retain all rights to your User Content, but by submitting it to the App, you grant us a non-exclusive, worldwide, royalty-free license to use, reproduce, and display such content for the purposes of providing the App.

4. Prohibited Activities
You agree not to engage in any of the following prohibited activities:

Violating any applicable laws or regulations.
Transmitting any harmful or malicious code, such as viruses or malware.
Interfering with or disrupting the App or servers or networks connected to the App.
Impersonating any person or entity or misrepresenting your affiliation with any person or entity.
Collecting or storing personal data of other users without their express permission.
5. Termination
We reserve the right to terminate or suspend your access to the App at our sole discretion, without prior notice, for conduct that we believe violates these Terms or is harmful to other users, us, or third parties.

6. Disclaimer of Warranties
The App is provided on an "as-is" and "as-available" basis. We do not make any warranties or representations about the accuracy or reliability of the App's content or its uninterrupted availability. Your use of the App is at your own risk.

7. Limitation of Liability
To the fullest extent permitted by law, we shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising from or relating to your use of the App or your inability to access or use the App.

8. Changes to Terms
We may update these Terms from time to time. We will notify you of any changes by posting the new Terms on this page. Your continued use of the App after any changes to these Terms constitutes your acceptance of the new Terms.

9. Governing Law
These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes arising out of or related to these Terms or the App shall be resolved in the courts located in [Your Jurisdiction].

10. Contact Us
If you have any questions about these Terms, please contact us:

Email: vakkayilshebin07@gmail.com''',style: ElaTextStyle.smallSubTitle,))),
        ));
  }
}