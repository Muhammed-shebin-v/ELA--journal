import 'package:new_ela/model/gaols/walk/walk.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WalkCountService {

  final Box<WalkModel> _walkCountBox = Hive.box<WalkModel>('walk');
  
  String _getDateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  Future<WalkModel> _getTodayCount() async {
    String dateKey = _getDateKey(DateTime.now());
    var count = _walkCountBox.get(dateKey);
    if (count == null) {
      count = WalkModel(date: DateTime.now(), intake: 0.0);
      await _walkCountBox.put(dateKey, count);
    }
    return count;
  }

  Future<void> increaseCount(double amount) async {
    final count = await _getTodayCount();
    count.intake += amount;
     await _walkCountBox.put(_getDateKey(count.date), count);
   
  }


  Future<void> decreaseCount(double amount) async {
    final count = await _getTodayCount();
    count.intake = (count.intake - amount).clamp(0, double.infinity);
     await _walkCountBox.put(_getDateKey(count.date), count); 
  }


  Future<double> getTodaycountAmount() async {
    final count = await _getTodayCount();
    return count.intake;
  }


   Future<List<WalkModel>> getWeeklyWalk() async {
    final weeklyData = <WalkModel>[];
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dateKey =   _getDateKey(date);
      final walkData = _walkCountBox.get(dateKey);
      if (walkData != null) {
         weeklyData.add(walkData);
      }
    }
    return  weeklyData.reversed.toList();
  }
  
}