// import 'package:ela/database/mood_function.dart';
// import 'package:ela/theme/app_color.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_heat_map/flutter_heat_map.dart';
// import 'package:hive/hive.dart';

// class MoodHeatmap extends StatefulWidget {
//   @override
//   _MoodHeatmapState createState() => _MoodHeatmapState();
// }

// class _MoodHeatmapState extends State<MoodHeatmap> {
//   Map<DateTime, String> moodData = {};
//   List<FlSpot> heatMapData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchMoodData(DateTime.now().subtract(Duration(days: 30)), DateTime.now()).then((data) {
//       setState(() {
//         moodData = data;
//         heatMapData = prepareHeatMapData(moodData);
//       });
//     });
//   }

//   List<FlSpot> prepareHeatMapData(Map<DateTime, String> moodData) {
//     List<FlSpot> spots = [];

//     moodData.forEach((date, mood) {
//       double intensity = getMoodIntensity(mood);
//       spots.add(FlSpot(date.millisecondsSinceEpoch.toDouble(), intensity));
//     });

//     return spots;
//   }

//   double getMoodIntensity(String mood) {
//     switch (mood) {
//       case 'happy':
//         return 6.0; // Maximum intensity
//       case 'sad':
//         return 4.0; // Medium intensity
//       case 'neutral':
//         return 2.0; // Low intensity
//       default:
//         return 0.0; // No intensity for other moods
//     }
//   }

//  Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Mood Heatmap'),
//     ),
//      body:SafeArea(child: 
//            HeatMapEvent.(
//               data: heatMapData, // Pass heatMapData directly if it's in the right format
//               colorMode: ColorMode.color,
//               startDate: DateTime.now().subtract(Duration(days: 30)),
//               endDate: DateTime.now(),
//               colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green],
//               showText: true,
//               showColor: true,
//             ))
         
//     );
  
//  }
// }