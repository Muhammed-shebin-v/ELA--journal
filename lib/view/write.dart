import 'package:new_ela/view/theme/app_color.dart';

import 'bucket_list.dart';
import 'diary.dart';
import 'todo_list.dart';
import 'widget/heading.dart';
import 'widget/write.dart';
import 'widget/write2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ElaColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
               Gap(20),
              Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      const CustomHeading(heading: 'Write',length: 80,),
                      const Gap(20),
                      const CustomWite(
                          title: 'Bucket List.',
                          titlelength: 130,
                          subtitle:
                              'you can add your dream places andthings to explore and enjoy...',
                          image: 'assets/images/IMG_3744 2.jpg',
                          location: BucketList()),
                      const Gap(40),
                      const CustomWrite2(
                          title: 'To Do.',
                          titlelength: 71,
                          subtitle:
                              '             add your to do list here.\nyou can mark the list items after\n          you completed that tasks.',
                          image: 'assets/images/IMG_3765 2.jpg',
                          location: TodoList()),
                      const Gap(40),
                      CustomWite(
                          title: 'Diary.',
                          titlelength: 65,
                          subtitle:
                              'you can add your daily diary here to remember everything that happened in your wonderful life...',
                          image: 'assets/images/IMG_3748 2.jpg',
                          location: Diary()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
