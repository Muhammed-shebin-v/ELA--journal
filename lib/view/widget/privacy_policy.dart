import 'package:new_ela/view/theme/app_color.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Privacy Policy',
        ),
        backgroundColor: ElaColors.white,),
        body: const SingleChildScrollView(
          
              child: Flexible(child: Text('''Privacy Policy for ELA
            
Effective Date: [Insert Date]
            
This Privacy Policy describes how ELA ("we," "our," or "us") collects, uses, and shares information about you when you use our mobile application (the "App").
            
1. Information We Collect
We do not collect personally identifiable information from users of the App unless you voluntarily provide it to us. The types of information we may collect include:
            
Personal Information: Your name, email address, or other details if you choose to provide them when contacting us or using certain features of the App.
Usage Data: We may collect information on how the App is accessed and used. This may include details such as your device's Internet Protocol address (e.g., IP address), browser type, browser version, the pages of our App that you visit, the time and date of your visit, and other diagnostic data.
2. Use of Information
We may use the information we collect for various purposes, including to:
            
Provide, maintain, and improve our App.
Notify you about changes to our App.
Allow you to participate in interactive features of our App when you choose to do so.
Provide customer support.
Monitor the usage of our App.
Detect, prevent, and address technical issues.
3. Disclosure of Information
We will not share your personal information with third parties unless we obtain your consent or are required to do so by law.
            
4. Security of Information
The security of your information is important to us, and we strive to use commercially acceptable means to protect your personal data. However, please remember that no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee its absolute security.
            
5. Changes to This Privacy Policy
We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Effective Date" at the top of this Privacy Policy.
            
6. Contact Us
If you have any questions about this Privacy Policy, please contact us:
            
Email: vakkayilshebin07@gmail.com
            
               ''')),
        ));
  }
}
