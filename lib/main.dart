import 'package:new_ela/model/bucket/bucket_model.dart';
import 'package:new_ela/model/diary/diary_model.dart';
import 'package:new_ela/model/gaols/read/read_model.dart';
import 'package:new_ela/model/gaols/sleep/sleep_model.dart';
import 'package:new_ela/model/gaols/walk/walk.dart';
import 'package:new_ela/model/mood/mood_model.dart';
import 'package:new_ela/model/todo/todo_model.dart';
import 'package:new_ela/model/gaols/water/water_model.dart';
import 'package:new_ela/view/splash.dart';
import 'model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(UserAdapter().typeId)){
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TodoModelAdapter());
  }
  if(!Hive.isAdapterRegistered(BucketModelAdapter().typeId)){
    Hive.registerAdapter(BucketModelAdapter());
  }
  if(!Hive.isAdapterRegistered(DiaryModelAdapter().typeId)){
    Hive.registerAdapter(DiaryModelAdapter());
  }
  if(!Hive.isAdapterRegistered(MoodModelAdapter().typeId)){
    Hive.registerAdapter(MoodModelAdapter());
  }
   if(!Hive.isAdapterRegistered(WaterModelAdapter().typeId)){
    Hive.registerAdapter(WaterModelAdapter());
  }
   if(!Hive.isAdapterRegistered(WalkModelAdapter().typeId)){
    Hive.registerAdapter(WalkModelAdapter());
  }
    if(!Hive.isAdapterRegistered(ReadModelAdapter().typeId)){
    Hive.registerAdapter(ReadModelAdapter());
  }
    if(!Hive.isAdapterRegistered(SleepModelAdapter().typeId)){
    Hive.registerAdapter(SleepModelAdapter());
  }
  await Hive.openBox<WalkModel>('walk'); 
  await Hive.openBox<WaterModel>('water');
  await Hive.openBox<ReadModel>('read');
  await Hive.openBox<SleepModel>('sleep');
  runApp(const Ela());

}

class Ela extends StatelessWidget {
  const Ela ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ela',
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}