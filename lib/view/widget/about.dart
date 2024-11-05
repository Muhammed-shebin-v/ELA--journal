import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
void elaaboutDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('About ELA'),
              content: const Text(
                '''
Welcome to ELA, your personal diary typing app designed to help you organize your thoughts and track your daily activities effortlessly. ELA provides a minimalistic and user-friendly interface, making it easy for you to focus on what truly matters.

Key Features:
Diary Entries: Capture your thoughts and memories with ease. Write, edit, and revisit your diary entries whenever you want.
Bucket List: Keep track of your dreams and aspirations. Add items to your bucket list and mark them off as you achieve them.
To-Do List: Stay organized with our simple to-do list feature. Add tasks, set priorities, and check them off as you complete them.
Daily Goals: Set and manage your daily goals to help you stay focused and motivated. Track your progress and celebrate your achievements.
Daily Moods: Reflect on your emotions by recording your daily moods. Gain insights into your emotional well-being over time.
ELA is designed for simplicity and functionality, allowing you to express yourself and stay organized without unnecessary distractions. Start your journey of self-reflection and personal growth today with ELA!''',
                style: ElaTextStyle.smallSubTitle,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'close',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
              backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
            ));
  }