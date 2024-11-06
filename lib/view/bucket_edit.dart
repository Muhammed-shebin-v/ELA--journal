import 'dart:developer';
import 'dart:typed_data';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:new_ela/controllers/bucket_function.dart';
import 'package:new_ela/model/bucket/bucket_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/button.dart';
import 'package:new_ela/view/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:new_ela/view/widget/image_add.dart';
import 'package:new_ela/view/widget/snackbar.dart';

// ignore: must_be_immutable
class BucketEdit extends StatefulWidget {
  BucketEdit(
      {super.key,
      required this.index,
      required this.bucket,
      required this.readonly});

  @override
  State<BucketEdit> createState() => _BucketEditState();
  final int index;
  BucketModel bucket;
  final bool readonly;
}

class _BucketEditState extends State<BucketEdit> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _titleController.text = widget.bucket.title!;
      _contentController.text = widget.bucket.content!;
      _destinationController.text = widget.bucket.destination!;
      _finalDate = widget.bucket.finalDate;
      _image1 = widget.bucket.image1;
      _image2 = widget.bucket.image2;
      ctnumber = widget.bucket.catogarynumber;
    });
  }

  final _formkey = GlobalKey<FormState>();
  final List<String> _displayTexts = [
    'Destination:',
    'Activity:',
    'Purchasing item:',
    'nothing:'
  ];

  DateTime? _finalDate;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _finalDateController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  Uint8List? _image1;
  Uint8List? _image2;
  int? ctnumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 35,
                    ),
                    const CustomHeading(heading: 'Bucket List.', length: 170)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 255, 210, 1),
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        child: Column(
                          children: [
                            const Gap(40),
                            Row(
                              children: [
                                const Text(
                                  'Title:',
                                  style: ElaTextStyle.formTitle,
                                ),
                                Flexible(
                                  child: TextFormField(
                                      maxLength: 30,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      style: ElaTextStyle.formitems,
                                      controller: _titleController,
                                      readOnly: widget.readonly,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  _displayTexts[ctnumber!],
                                  style: ElaTextStyle.formTitle,
                                ),
                                Flexible(
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      style: ElaTextStyle.formitems,
                                      controller: _destinationController,
                                      readOnly: widget.readonly,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Final Date:',
                                  style: ElaTextStyle.formTitle,
                                ),
                                Flexible(
                                  child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          hintText: _finalDate != null
                                              ? DateFormat('dd-MM-yyyy').format(
                                                  widget.bucket.finalDate!)
                                              : 'Pick Final Date',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                width: 2),
                                          ),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                _pickDate();
                                              },
                                              icon: const Icon(Icons
                                                  .calendar_view_day_rounded)))),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Did you missed something?';
                                }
                                return null;
                              },
                              style: ElaTextStyle.formitems,
                              controller: _contentController,
                              readOnly: widget.readonly,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                hintText: 'Write your BucketList ',
                                border: InputBorder.none,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 CustomImageAdd(
                                      image: _image1,
                                      onImageSelected: (image) {
                                        setState(() {
                                          _image1 = image;
                                        });
                                      }),
                                      CustomImageAdd(image: _image2, onImageSelected: (image){
                                        setState(() {
                                          _image2=image;
                                        });
                                      })

                              ],
                            ),
                            InkWell(
                          onTap: ()async{
                          if (_titleController.text.isNotEmpty &&
                                  _destinationController.text.isNotEmpty&&
                                  _contentController.text.isNotEmpty) {
                              final String title=_titleController.text.trim();
                              final String destination=_destinationController.text.trim();
                              // final String finalDate=_finalDateController.text.trim();
                                    final String content =
                                        _contentController.text.trim();
                                    final bucket = BucketModel(
                                        title: title,
                                        content: content,
                                        destination: destination,
                                        finalDate: _finalDate,
                                        catogarynumber:
                                            widget.bucket.catogarynumber,
                                        createDate: widget.bucket.createDate,
                                        image1: _image1,
                                        image2: _image2);
                                    await updateBucket(
                                        bucket: bucket, index: widget.index);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context, true);
                                    _titleController.clear();
                                    _contentController.clear();
                                    _destinationController.clear();
                                    _finalDateController.clear();
                                  } else {
                                    customSnackBar(
                                        ctx: context,
                                        text: "oops! Did you miss  something?",
                                        color: ElaColors.red);
                                  }
                                },
                                child: CustomButton(
                                  text: 'SAVE',
                                  width: 80,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickDate() {
    BottomPicker.date(
      pickerTitle: const Text(
        'Final Date',
      ),
      onSubmit: (date) {
        setState(() {
          _finalDate = date;
        });
      },
      bottomPickerTheme: BottomPickerTheme.blue,
      maxDateTime: DateTime(2100),
      minDateTime:DateTime.now().add(const Duration(days: 10)),
    ).show(context);
  }
}
