import 'package:new_ela/model/gaols/read/read_model.dart';
import 'package:new_ela/model/gaols/sleep/sleep_model.dart';
import 'package:new_ela/model/gaols/walk/walk.dart';
import 'package:new_ela/model/gaols/water/water_model.dart';
import 'package:new_ela/model/mood/mood_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:new_ela/view/widget/title.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class CustomGraph extends StatelessWidget {
  dynamic weeklyData;
  String modelType;
  String errorMessage;
  String title;
  double maximumvalue;
  double intervels;
  String? unit;
  double? titleLength;
  CustomGraph(
      {super.key,
      required this.weeklyData,
      required this.modelType,
      required this.errorMessage,
      required this.title,
      required this.intervels,
      required this.maximumvalue,
      this.unit,
      this.titleLength});

  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            modelType!='mood'?
            CustomTitle(heading: 'Weekly $title ($unit)', length: titleLength!)
            :const SizedBox(),
            const Gap(2),
            CustomContainer(
              boxshadow: true,
              child: Column(
                children: [
                  modelType=='mood'?
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15),
                    child: CustomTitle(heading: 'Weekly Mood', length: 145),
                  ):const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: weeklyData.isEmpty
                        ? Center(child: Text(errorMessage))
                        : SfCartesianChart(
                            plotAreaBackgroundColor: ElaColors.lightgrey,
                            primaryXAxis: const CategoryAxis(
                                ),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: maximumvalue,
                              interval: intervels,
                            ),
                            series: [
                              if (modelType == 'water')
                                LineSeries<WaterModel, String>(
                                  dataSource: weeklyData as List<WaterModel>,
                                  xValueMapper: (WaterModel water, _) =>
                                      water.date.day.toString(),
                                  yValueMapper: (WaterModel water, _) =>
                                      water.intake,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  name: 'Water Intake',
                                )
                              else if (modelType == 'walk')
                                LineSeries<WalkModel, String>(
                                  dataSource: weeklyData,
                                  xValueMapper: (WalkModel walk, _) =>
                                      walk.date.day.toString(),
                                  yValueMapper: (WalkModel walk, _) => walk.intake,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  name: 'Mood Level',
                                )
                              else if (modelType == 'read')
                                LineSeries<ReadModel, String>(
                                  dataSource: weeklyData,
                                  xValueMapper: (ReadModel read, _) =>
                                      read.date.day.toString(),
                                  yValueMapper: (ReadModel read, _) => read.intake,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  name: 'read',
                                )
                              else if (modelType == 'sleep')
                                LineSeries<SleepModel, String>(
                                  dataSource: weeklyData,
                                  xValueMapper: (SleepModel sleep, _) =>
                                      sleep.date.day.toString(),
                                  yValueMapper: (SleepModel sleep, _) =>
                                      sleep.intake,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  name: 'read',
                                )
                              else if (modelType == 'mood')
                                ColumnSeries<MoodModel, String>(
                                  dataSource: weeklyData as List<MoodModel>,
                                  xValueMapper: (MoodModel mood, _) =>
                                      mood.date.day.toString(),
                                  yValueMapper: (MoodModel mood, _) =>
                                      moodToValue(mood.mood),
                                  pointColorMapper: (MoodModel mood, _) =>
                                      colorSelector(mood
                                          .mood),
                                  name: 'Mood Level',
                                  borderColor: ElaColors.black,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  borderWidth: 0.4,
                                ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
  }

  dynamic colorSelector(String mood) {
    switch (mood) {
      case 'excelent':
        return ElaColors.emojicolor1;
      case 'very good':
        return ElaColors.emojicolor2;
      case 'good':
        return ElaColors.emojicolor3;
      case 'not bad':
        return ElaColors.emojicolor4;
      case 'bad':
        return ElaColors.emojicolor5;
      case 'very bad':
        return ElaColors.emojicolor6;
      default:
        return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  int moodToValue(String mood) {
    switch (mood) {
      case 'excelent':
        return 6;
      case 'very good':
        return 5;
      case 'good':
        return 4;
      case 'not bad':
        return 3;
      case 'bad':
        return 2;
      case 'very bad':
        return 1;
      default:
        return 0;
    }
  }

}
