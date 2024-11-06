import 'package:new_ela/controllers/diary_function.dart';
import 'package:new_ela/model/diary/diary_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:new_ela/view/widget/title.dart';
import 'diary.dart';
import 'widget/container.dart';
import 'widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Calender> {
  DateTime _selectedDate = DateTime.now();
  DiaryModel? _diaryEntries;

  @override
  void initState() {
    super.initState();
    _loadDiaryEntries();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = focusedDay;
      _loadDiaryEntries();
    });
  }

  void _loadDiaryEntries() async {
    final diaryEntry = await fetchDiary(date: _selectedDate);
    setState(() {
      _diaryEntries = diaryEntry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Gap(20),
              const CustomHeading(
                heading: 'Calender',
                length: 135,
              ),
              const Gap(20),
              CustomContainer(
                  boxshadow: true,
                  height: 520,
                  child: Column(
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40.0, right: 20),
                            child: Text(
                              DateFormat('d').format(_selectedDate),
                              style: const TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 1,
                            color: Colors.black,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 20),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('MMMM').format(_selectedDate),
                                  style: ElaTextStyle.heading,
                                ),
                                Text(
                                  DateFormat('y').format(_selectedDate),
                                  style: ElaTextStyle.heading,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      TableCalendar(
                          firstDay: DateTime.utc(2020, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _selectedDate,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, _selectedDate),
                          onDaySelected: _onDaySelected,
                          calendarFormat: CalendarFormat.month,
                          availableCalendarFormats: const {
                            CalendarFormat.month: '',
                          },
                          headerStyle: const HeaderStyle(),
                          calendarStyle: const CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: ElaColors.green,
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              color: ElaColors.black,
                            ),
                            todayTextStyle: TextStyle(
                              color: ElaColors.black,
                            ),
                            todayDecoration: BoxDecoration(
                              color: ElaColors.lightgreen,
                              shape: BoxShape.circle,
                            ),
                          ))
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: CustomTitle(heading: 'Diary', length: 60),
              ),
              InkWell(
                onTap: () {
                  if (_selectedDate.isBefore(DateTime.now())) {
                   _navigateToDiary(context, _diaryEntries, _selectedDate);
                  } else {
                    customSnackBar(
                        color: ElaColors.red,
                        ctx: context,
                        text: "Sorry,You can't add a diary for a future date");
                  }
                },
                child: CustomContainer(
                  color: ElaColors.lightgreen,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                              _diaryEntries != null
                                  ? _diaryEntries!.title
                                  : 'oops! No Diary Found ',
                              style: ElaTextStyle.title),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(_selectedDate),
                          style: ElaTextStyle.subTitle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      )),
    );
  }
   Future<void> _navigateToDiary(
      BuildContext context,diaryEntry,selectedDate) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Diary(diary: diaryEntry,selecteddate: selectedDate)),
    );
    if (result == true) {
      _loadDiaryEntries();
    }
  }
}
