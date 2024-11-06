import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_ela/controllers/read_goal.dart';
import 'package:new_ela/controllers/sleep_goal.dart';
import 'package:new_ela/controllers/walk.dart';
import 'package:new_ela/controllers/water_goal_function.dart';
import 'package:new_ela/model/gaols/read/read_model.dart';
import 'package:new_ela/model/gaols/sleep/sleep_model.dart';
import 'package:new_ela/model/gaols/walk/walk.dart';
import 'package:new_ela/model/mood/mood_model.dart';
import 'package:new_ela/model/gaols/water/water_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:new_ela/view/widget/drawer.dart';
import 'package:new_ela/view/widget/graph.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../controllers/user_functions.dart';
import '../model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  UserModel? _user;
  UserModel? userdata;

  late Map<DateTime, String> moodDatabase;
  List<MoodModel> weeklyMoodData = [];
  late Box<MoodModel> moodBox;
// -- - - - - - -- - - - - -- - -- -- -- - -
  List<WaterModel> weeklyWaterData = [];
  final WaterIntakeService _waterService = WaterIntakeService();
// - - - -   - -  -   - - -  -  - - - -- ---
  List<WalkModel> weeklyWalkData = [];
  final WalkCountService _walkService = WalkCountService();
  // - ---- -- - - -- - -- - - --- - - - - --
  List<ReadModel> weeklyReadData = [];
  final ReadPageService _readService = ReadPageService();
// - ---- -- - - -- - -- - - --- - - - - ----
  List<SleepModel> weeklySleepData = [];
  final SleepService _sleepService = SleepService();
// - - -- - - - -- -- - -- - - - -- - - -----

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadMoodData();
    loadWaterData();
    loadWalkData();
    loadReadData();
    loadSleepData();
  }

  void loadUserData() async {
    userdata = await fetchUserdata();
    setState(() {
      _user = userdata;
    });
  }

// mood data ==- - - - - - - - - - - - - - - - - -
  Future<void> loadMoodData() async {
    await Hive.initFlutter();
    moodBox = await Hive.openBox<MoodModel>('mood');
    loadWeeklyMoodData();
  }

  String formatDate(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  void loadWeeklyMoodData() {
    final weekData = <MoodModel>[];
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final formattedDate = formatDate(date);
      final moodData = moodBox.get(formattedDate);
      if (moodData != null) {
        weekData.add(moodData);
      }
    }
    setState(() {
      weeklyMoodData = weekData.reversed.toList();
    });
  }
// mood data -- -- -- - - - - - - - - - - - -- - - - -

// water data  - - - - - - - - - - - - - - - - - - -
  Future<void> loadWaterData() async {
    List<WaterModel> data = await _waterService.getWeeklyIntake();
    setState(() {
      weeklyWaterData = data;
    });
  }

// walk data  - - - - - - - - - - - - - - - - - - -
  Future<void> loadWalkData() async {
    List<WalkModel> walk = await _walkService.getWeeklyWalk();
    setState(() {
      weeklyWalkData = walk;
    });
  }

// read data  - - - - - - - - - - - - - - - - - - -
  Future<void> loadReadData() async {
    List<ReadModel> read = await _readService.getWeeklyRead();
    setState(() {
      weeklyReadData = read;
    });
  }

// sleep data  - - - - - - - - - - - - - - - - - - -
  Future<void> loadSleepData() async {
    List<SleepModel> sleep = await _sleepService.getWeeklySleep();
    setState(() {
      weeklySleepData = sleep;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> graphList = [
      CustomGraph(
        weeklyData: weeklyWaterData,
        modelType: 'water',
        errorMessage: 'error found',
        title: 'water',
        intervels: 500,
        maximumvalue: 4000,
        unit: 'mL',
        titleLength: 190,
      ),
      CustomGraph(
          weeklyData: weeklyWalkData,
          modelType: 'walk',
          errorMessage: 'error',
          title: 'walk',
          intervels: 1000,
          maximumvalue: 10000,
          unit: 'step',
          titleLength: 190),
      CustomGraph(
          weeklyData: weeklyReadData,
          modelType: 'read',
          errorMessage: 'error',
          title: 'read',
          intervels: 5,
          maximumvalue: 40,
          unit: 'page',
          titleLength: 200),
      CustomGraph(
          weeklyData: weeklySleepData,
          modelType: 'sleep',
          errorMessage: 'error',
          title: 'sleep',
          intervels: 1,
          maximumvalue: 8,
          unit: 'Hr',
          titleLength: 185),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 10),
                          child: Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Image(
                                  height: 40,
                                  width: 40,
                                  image:
                                      AssetImage('assets/icons/hamburger.png')),
                            );
                          }),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 35,
                                width: 85,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(245, 255, 210, 1),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Text('ELA', style: GoogleFonts.kalnia(fontSize: 40))
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    CustomContainer(
                      color: ElaColors.lightgreen,
                      boxshadow: true,
                      height: 200,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              height: 140,
                              width: 140,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _user?.image == null
                                      ? const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/icons/user.png'))
                                      : Image.memory(
                                          _user!.image!,
                                          fit: BoxFit.cover,
                                        )),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name : ${_user?.name ?? 'Not Available'}',
                              style: ElaTextStyle.subTitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Address : ${_user?.address ?? 'Not Available'}',
                              style: ElaTextStyle.subTitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'DOB : ${_user?.dob ?? 'Not Available'}',
                              style: ElaTextStyle.subTitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Phone : ${_user?.phone.toString() ?? 'Not Available'}',
                              style: ElaTextStyle.subTitle,
                            )
                          ],
                        )
                      ]),
                    ),
                    const Gap(30),
                    CustomGraph(
                        weeklyData: weeklyMoodData,
                        modelType: 'mood',
                        errorMessage: 'error',
                        title: 'mood',
                        intervels: 1,
                        maximumvalue: 6),
                    const Gap(30),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 450,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                      ),
                      items: graphList.map((graph) {
                        return Builder(
                          builder: (BuildContext context) {
                            return graph;
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ]))),
        ),
        drawer: CustomDrawer(context: context));
  }
}
