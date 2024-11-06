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
          'Privacy Policy',style: ElaTextStyle.heading,
        ),
        backgroundColor: ElaColors.white,),
        body: const SafeArea(
          child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
Text('Privacy Policy',style: ElaTextStyle.heading,),
Gap(10),
Text(''' Last updated: November 05, 2024
                  

This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use our Service. It explains Your privacy rights and how the law protects You. We use Your Personal Data to enhance Your experience within the Application and keep Your information secure.
By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.'''),
Gap(30),
Text('1. Definitions',style: ElaTextStyle.heading,),
Gap(10),
Text('''* Application refers to ELA, the software program provided by the Company.
* Company (referred to as "We," "Us," or "Our") refers to ELA.
* Country refers to: Kerala, India.
* Device means any device that can access the Service, such as a smartphone, computer, or tablet.
* Personal Data is any information that relates to an identified or identifiable individual.
* Service refers to the Application.
* You means the individual accessing or using the Service.'''),
Gap(30),
Text('2. Collection and Use of Personal Data',style: ElaTextStyle.heading,),
Gap(10),
Text('''We collect limited personal information to improve Your experience within the Application. The following types of data may be collected:
  * Personal Data: When using our Service, we may ask You to provide certain personally identifiable information that can be used to identify or contact You. This information may include:
      * Username
      * Address
      * Phone number
      * Profile image
      * Date of birth
This data is collected solely to enhance Your experience within the Application by allowing You to view and manage Your own details. We do not share this information with any other users or third parties. If You do not wish to provide this data, You may enter dummy information, as it is only used for display within the Application.
'''),
Text('  * Usage Data: We may collect information automatically about how the Service is accessed and used. This data helps us understand usage patterns but does not identify You personally.'),
Gap(30),
Text('3. Local Storage and Security Measures',style: ElaTextStyle.heading),
Gap(10),
Text('All data provided by You is stored locally on Your Device using the Hive database. Hive is a local storage database, meaning Your data is only accessible on the specific Device where it was entered. Your data is not shared, stored, or transferred to any external server or third-party service, ensuring that only You have access to Your information.'),
Gap(30),
Text('4. Retention of Personal Data',style: ElaTextStyle.heading),
Gap(10),
Text('The Company will retain Your Personal Data only for as long as You use the Application on Your Device. You have full control over the data and can delete or update it as desired'),
Gap(30),
Text('5. Security of Personal Data',style: ElaTextStyle.heading),
Gap(10),
Text('We prioritize the security of Your Personal Data. However, please remember that no method of electronic storage is completely secure. While We strive to use reasonable means to protect Your data, we cannot guarantee absolute security.'),
Gap(30),
Text('6. Your Rights to Manage Your Data',style: ElaTextStyle.heading),
Gap(10),
Text('You may access, update, or delete Your data at any time within the Application. If You choose not to provide certain information, it will not impact Your use of the core features of the Application.'),
Gap(30),
Text("7. Children's Privacy",style: ElaTextStyle.heading),
Gap(10),
Text('Our Service does not address anyone under the age of 13. We do not knowingly collect information from anyone under 13. If we learn that a child under 13 has provided Us with Personal Data, we will take steps to delete it from our systems.'),
Gap(30),
Text('8. Links to Other Sites',style: ElaTextStyle.heading),
Gap(10),
Text('Our Service does not contain links to third-party sites.'),
Gap(30),
Text('9. Changes to This Privacy Policy',style: ElaTextStyle.heading),
Gap(10),
Text('We may update Our Privacy Policy from time to time. Changes will be effective when posted on this page.'),
Gap(30),
Text('10. Contact Us',style: ElaTextStyle.heading),
Gap(10),
Text('''If You have any questions about this Privacy Policy, You can contact us:
By email: vakkayilshebin07@gmail.com'''),
                    ],
                  
                  ),
                )),
          ),
        );
  }
}
