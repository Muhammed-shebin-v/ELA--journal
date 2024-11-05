import 'dart:developer';
import 'package:new_ela/controllers/read_goal.dart';
import 'package:new_ela/controllers/sleep_goal.dart';
import 'package:new_ela/controllers/walk.dart';
import 'package:new_ela/controllers/water_goal_function.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/snackbar.dart';
import 'widget/dialygoals.dart';
import 'widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final WaterIntakeService waterService = WaterIntakeService();
  double currentIntake = 0.0;
  final double dailyGoal = 4000.0;

  final WalkCountService walkService = WalkCountService();
  double currentCount = 0.0;
  final double dailyGoalwalk = 10000.0;

  final ReadPageService readPageService = ReadPageService();
  double currentPage = 0.0;
  final double dailyGoalPage = 40.0;

  final SleepService sleepService = SleepService();
  double currentSleep = 0.0;
  final double dailyGoalSleep = 8.0;

  @override
  void initState() {
    super.initState();
    loadCurrentIntake();
    loadCurrentCount();
    loadCurrentPage();
    loadCurrentSleep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElaColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Gap(20),
                const CustomHeading(
                  heading: 'Dialy Goals',
                  length: 165,
                ),
                const Gap(20),
                CustomDialyGoals(
                  increasefunction: increaseIntake,
                  decreasefunction: decreaseIntake,
                  currentIntake: currentIntake,
                  dialyGoal: dailyGoal,
                  unit: 'mls',
                  title: 'water',
                  titlelength: 60,
                  subtitle:
                      '"Drink at least 3liters of water daily.Aim for 4liters to reach your hydration goal!"',
                ),
                const Gap(20),
                CustomDialyGoals(
                  increasefunction: increaseCount,
                  decreasefunction: decreaseCount,
                  currentIntake: currentCount,
                  dialyGoal: dailyGoalwalk,
                  unit: 'Stps',
                  title: 'walk',
                  titlelength: 55,
                  subtitle:
                      '"Walk at least 8,000 steps daily. Aim for 10,000 to reach your goal!"',
                ),
                const Gap(20),
                CustomDialyGoals(
                  increasefunction: increasePage,
                  decreasefunction: decreasePage,
                  currentIntake: currentPage,
                  dialyGoal: dailyGoalPage,
                  unit: 'Pgs',
                  title: 'Read',
                  titlelength: 55,
                  subtitle:
                      '"Read at least 20 pages daily. Aim for 40 to hit your goal!"',
                ),
                const Gap(20),
                CustomDialyGoals(
                  increasefunction: increaseSleep,
                  decreasefunction: decreaseSleep,
                  currentIntake: currentSleep,
                  dialyGoal: dailyGoalSleep,
                  unit: 'Hrs',
                  title: 'Sleep',
                  titlelength: 60,
                  subtitle:
                      '"Aim for at least 6 hours of sleep each night. Strive for 8 hours to truly recharge and thrive!"',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadCurrentPage() async {
    final page = await readPageService.getTodayPageAmount();
    log('loaded data');
    setState(() {
      currentPage = page;
    });
  }

  void increasePage() async {
    if (currentPage + 5.0 <= dailyGoalPage) {
      await readPageService.increasePage(5.0);
      loadCurrentPage();
    } else {
      customSnackBar(
          ctx: context,
          text: "You've reached your daily goal!",
          color: ElaColors.red);
    }
  }

  void decreasePage() async {
    if (currentPage - 5.0 >= 0) {
      await readPageService.decreasePage(5.0);
      loadCurrentPage();
    } else {
      customSnackBar(
          ctx: context,
          text: "Intake cannot go below zero.",
          color: ElaColors.red);
    }
  }

  Future<void> loadCurrentSleep() async {
    final sleep = await sleepService.getTodaySleepAmount();
    log('loaded data');
    setState(() {
      currentSleep = sleep;
    });
  }

  void increaseSleep() async {
    if (currentSleep + 1.0 <= dailyGoalSleep) {
      await sleepService.increaseSleep(1.0);
      loadCurrentSleep();
    } else {
      customSnackBar(
          ctx: context,
          text: "You've reached your daily goal!",
          color: ElaColors.red);
    }
  }

  void decreaseSleep() async {
    if (currentSleep - 1.0 >= 0) {
      await sleepService.decreaseSleep(1.0);
      loadCurrentSleep();
    } else {
      customSnackBar(
          ctx: context,
          text: "Intake cannot go below zero.",
          color: ElaColors.red);
    }
  }

  Future<void> loadCurrentCount() async {
    final count = await walkService.getTodaycountAmount();
    log('loaded data');
    setState(() {
      currentCount = count;
    });
  }

  void increaseCount() async {
    if (currentCount + 1000.0 <= dailyGoalwalk) {
      await walkService.increaseCount(1000.0);
      loadCurrentCount();
    } else {
      customSnackBar(
          ctx: context,
          text: "You've reached your daily goal!",
          color: ElaColors.red);
    }
  }

  void decreaseCount() async {
    if (currentCount - 1000.0 >= 0) {
      await walkService.decreaseCount(1000.0);
      loadCurrentCount();
    } else {
      customSnackBar(
          ctx: context,
          text: "Intake cannot go below zero.",
          color: ElaColors.red);
    }
  }

  Future<void> loadCurrentIntake() async {
    final intake = await waterService.getTodayIntakeAmount();
    log('loaded data');
    setState(() {
      currentIntake = intake;
    });
  }

  void increaseIntake() async {
    if (currentIntake + 500.0 <= dailyGoal) {
      await waterService.increaseIntake(500.0);
      loadCurrentIntake();
    } else {
      customSnackBar(
          ctx: context,
          text: "You've reached your daily goal!",
          color: ElaColors.red);
    }
  }

  void decreaseIntake() async {
    if (currentIntake - 500.0 >= 0) {
      await waterService.decreaseIntake(500.0);
      loadCurrentIntake();
    } else {
      customSnackBar(
          ctx: context,
          text: "Intake cannot go below zero.",
          color: ElaColors.red);
    }
  }
}
