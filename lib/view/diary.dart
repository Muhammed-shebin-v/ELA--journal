import 'dart:developer';
import 'dart:typed_data';
import 'package:new_ela/controllers/diary_function.dart';
import 'package:new_ela/controllers/user_functions.dart';
import 'package:new_ela/model/diary/diary_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/back_button.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:new_ela/view/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_ela/view/widget/snackbar.dart';

// ignore: must_be_immutable
class Diary extends StatefulWidget {
  Diary({super.key, this.selecteddate, this.diary});

  DateTime? selecteddate;
  DiaryModel? diary;
  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  Uint8List? _image1;
  Uint8List? _image2;
  DiaryModel? diarydata;
  @override
  void initState() {
    super.initState();
    if (widget.diary != null) {
      if (widget.diary!.title.isNotEmpty) {
        _titleController.text = widget.diary!.title;
      }
      if (widget.diary!.content.isNotEmpty) {
        _contentController.text = widget.diary!.content;
      }
      if (widget.diary!.image1 != null) {
        _image1 = widget.diary!.image1;
      }
      if (widget.diary!.image2 != null) {
        _image2 = widget.diary!.image2;
      }
    }
    if (widget.selecteddate == null) {
      todayDiary();
    }
  }

  Future<void> todayDiary() async {
    final diaryEntry = await fetchDiary(date: DateTime.now());
    log('fn called');
    diaryEntry != null
        ? setState(() {
            diarydata = diaryEntry;
            log('data fetched and added');
          })
        : setState(() {
            diarydata =
                DiaryModel(date: DateTime.now(), title: '', content: '');
          });
    if (diarydata!.title.isNotEmpty) {
      _titleController.text = diarydata!.title;
    }
    if (diarydata!.content.isNotEmpty) {
      _contentController.text = diarydata!.content;
    }
    if (diarydata!.image1 != null) {
      _image1 = diarydata!.image1;
    }
    if (diarydata!.image2 != null) {
      _image2 = diarydata!.image2;
    }
    widget.selecteddate ??= diarydata!.date;
  }

  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (widget.diary != null) {
  //     _titleController.text = widget.diary!.title;
  //     _contentController.text = widget.diary!.content;
  //   } else {
  //     _titleController.text = '';
  //     _contentController.text = '';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(70),
              Row(
                children: [
                  CustomBackButton(ctx: context),
                  const CustomHeading(heading: 'Diary', length: 80)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomContainer(
                  color: ElaColors.lightgreen,
                  boxshadow: true,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Gap(30),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 30,
                            width: 132,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromRGBO(194, 246, 58, 1),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Text(
                                (widget.selecteddate.toString()),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text(
                              'Title:',
                              style: ElaTextStyle.formTitle,
                            ),
                            Flexible(
                              child: TextFormField(
                                  maxLength: 40,
                                  style: ElaTextStyle.formitems,
                                  controller: _titleController,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const Gap(20),
                        TextFormField(
                          style: ElaTextStyle.formTitle,
                          controller: _contentController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Write your diary entry',
                            border: InputBorder.none,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () async {
                                  _image1 = await pickSaveImage();
                                  setState(() {});
                                },
                                child: Container(
                                  width: 150,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(245, 245, 245, 1),
                                    border: Border.all(width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: _image1 == null
                                        ? const Placeholder()
                                        : Image.memory(
                                            _image1!,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () async {
                                  _image2 = await pickSaveImage();
                                  setState(() {});
                                },
                                child: Container(
                                  width: 150,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(245, 245, 245, 1),
                                    border: Border.all(width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: _image2 == null
                                        ? const Placeholder()
                                        : Image.memory(
                                            _image2!,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () async {
                            if (_contentController.text.isNotEmpty &&
                                _titleController.text.isNotEmpty) {
                              _saveddiary();
                            } else {
                              customSnackBar(
                                  ctx: context,
                                  text: 'oops! Did you  miss something?',
                                  color: ElaColors.red);
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromRGBO(194, 246, 58, 1),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 25, top: 5),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveddiary() async {
    final diaryEntry = DiaryModel(
        date: widget.selecteddate ?? DateTime.now(),
        title: _titleController.text,
        content: _contentController.text,
        image1: _image1,
        image2: _image2);
    await addDiary(diary: diaryEntry);
    Navigator.pop(context, true);
  }
}
