import 'package:new_ela/model/gaols/read/read_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReadPageService {

  final Box<ReadModel> _readPageBox = Hive.box<ReadModel>('read');

  String _getDateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  Future<ReadModel> _getTodayPage() async {
    String dateKey = _getDateKey(DateTime.now());
    var page = _readPageBox.get(dateKey);
    if (page == null) {
      page = ReadModel(date: DateTime.now(), intake: 0.0);
      await _readPageBox.put(dateKey, page);
    }
    return page;
  }

  Future<void> increasePage(double amount) async {
    final page = await _getTodayPage();
    page.intake += amount;
     await _readPageBox.put(_getDateKey(page.date), page);
     
  }


  Future<void> decreasePage(double amount) async {
    final page = await _getTodayPage();
    page.intake = (page.intake - amount).clamp(0, double.infinity);
     await _readPageBox.put(_getDateKey(page.date), page); 
  }


  Future<double> getTodayPageAmount() async {
    final page = await _getTodayPage();
    return page.intake;
  }

  Future<List<ReadModel>> getWeeklyRead() async {
    final weeklyData = <ReadModel>[];
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dateKey =   _getDateKey(date);
      final readData = _readPageBox.get(dateKey);
      if (readData != null) {
         weeklyData.add(readData);
      }
    }
    return  weeklyData.reversed.toList();
  }
  
}