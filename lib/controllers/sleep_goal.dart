import 'package:new_ela/model/gaols/sleep/sleep_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SleepService {
  final Box<SleepModel> _sleepBox = Hive.box<SleepModel>('sleep');
  String _getDateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  Future<SleepModel> _getTodaySleep() async {
    String dateKey = _getDateKey(DateTime.now());
    var sleep = _sleepBox.get(dateKey);
    if (sleep == null) {
      sleep = SleepModel(date: DateTime.now() , intake: 0.0);
      await _sleepBox.put(dateKey, sleep);
    }
    return sleep;
  }

  Future<void> increaseSleep(double amount) async {
    final sleep = await _getTodaySleep();
    sleep.intake += amount;
     await _sleepBox.put(_getDateKey(sleep.date), sleep);

  }


  Future<void> decreaseSleep(double amount) async {
    final sleep = await _getTodaySleep();
    sleep.intake = (sleep.intake - amount).clamp(0, double.infinity);
     await _sleepBox.put(_getDateKey(sleep.date), sleep); 
  }


  Future<double> getTodaySleepAmount() async {
    final sleep = await _getTodaySleep();
    return sleep.intake;
  }

  Future<List<SleepModel>> getWeeklySleep() async {
    final weeklyData = <SleepModel>[];
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dateKey =   _getDateKey(date);
      final sleepData = _sleepBox.get(dateKey);
      if (sleepData != null) {
         weeklyData.add(sleepData);
      }
    }
    return  weeklyData.reversed.toList();
  }

  
}