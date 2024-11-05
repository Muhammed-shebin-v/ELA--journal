

import 'dart:developer';

import 'package:new_ela/model/mood/mood_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';


Future<void> saveMood({ required MoodModel mood}) async {
   final moodBox = await Hive.openBox<MoodModel>('mood');
   String datekey=DateFormat('yyyy-MM-dd').format(mood.date);
    await moodBox.put(datekey,mood); 
    MoodModel? _check= await moodBox.get(datekey);
    log(_check!.mood);
  }

