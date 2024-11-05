import 'package:new_ela/model/diary/diary_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

Future<void> addDiary({required DiaryModel diary}) async{
  String datekey=DateFormat('yyyy-MM-dd').format(diary.date);
   final diarydb = await Hive.openBox<DiaryModel>('diary');
   await diarydb.put(datekey, diary);
}
Future<DiaryModel?> fetchDiary({required DateTime date}) async {
  final diaryBox = await Hive.openBox<DiaryModel>('diary');
  final dateKey = DateFormat('yyyy-MM-dd').format(date);
  return diaryBox.get(dateKey);
}