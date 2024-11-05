import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/button.dart';

import 'package:new_ela/view/widget/intro_pageview.dart';
import 'package:gap/gap.dart';

import 'create_acount.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _contrller = PageController();
    return Scaffold(
      backgroundColor: ElaColors.lightgreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                const Gap(50),
                 Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('ELA', style: GoogleFonts.kalnia(fontSize: 50))),
                ),
                SizedBox(
                  height: 480,
                  child: PageView(
                    controller: _contrller,
                    children: const [
                      CustomIntroPageView(image: 'assets/images/IMG_3744 2.jpg', subtitle: '"Organize your life effortlessly with our app! Manage your daily diary, to-do lists, bucket lists, and moods—all in one place!"'),
                      CustomIntroPageView(image: 'assets/images/IMG_3748 2.jpg', subtitle: '"Stay on top of your day with our all-in-one planner. Capture your dreams, check off tasks, and track your progress!"'),
                      CustomIntroPageView(image: 'assets/images/mood-image.jpg', subtitle: '"From daily reflections to bucket list adventures, keep everything in check and stay motivated every day!"'),
                      CustomIntroPageView(image: 'assets/images/IMG_3765 2.jpg', subtitle: '"Boost your productivity and happiness—log your thoughts, tasks, moods, and goals in a single, powerful app!"'),
                    ],
                  ),
                ),
                const Gap(50),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(16),
                    color: ElaColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SmoothPageIndicator(
                        controller: _contrller,
                        count: 4,
                        axisDirection: Axis.horizontal,
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 20,
                            dotColor: Colors.black,
                            activeDotColor: Colors.black,
                            strokeWidth: 1,
                            paintStyle: PaintingStyle.stroke)),
                  ),
                ),
                const Gap(40),
                Padding(
                  padding:  const EdgeInsets.only(right: 30.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUp()));},
                      child: CustomButton(text: 'skip',width: 65,)
                    ),
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
