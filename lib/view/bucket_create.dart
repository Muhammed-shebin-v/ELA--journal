import 'dart:developer';
import 'dart:typed_data';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:new_ela/controllers/bucket_function.dart';
import 'package:new_ela/controllers/user_functions.dart';
import 'package:new_ela/model/bucket/bucket_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/back_button.dart';
import 'package:new_ela/view/widget/bucket_form.dart';
import 'package:new_ela/view/widget/button.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:new_ela/view/widget/heading.dart';
import 'package:new_ela/view/widget/image_add.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BucketView extends StatefulWidget {
  const BucketView({
    super.key,
  });

  @override
  State<BucketView> createState() => _BucketViewState();
}

class _BucketViewState extends State<BucketView> {
  @override
  void initState() {
    super.initState();
    _selectedValue = _dropDownItems[0];
    _displayText = _displayTexts[0];
    _textindex = _dropDownItems.indexOf(_selectedValue!);
  }

  final List<String> _dropDownItems = ['Travel', 'Activity', 'Purchase'];
  final List<String> _displayTexts = [
    'Destination:',
    'Activity:',
    'Purchasing item:',
    'nothing:'
  ];
  String? _displayText;
  String? _selectedValue;
  int? _textindex;
  DateTime? _finalDate;
  final DateTime createDate = DateTime.now();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _finalDateController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  Uint8List? _image1;
  Uint8List? _image2;
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
                  const CustomHeading(heading: 'Bucket List.', length: 170)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomContainer(
                  boxshadow: true,
                  color: ElaColors.lightgreen,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        children: [
                          const Gap(30),
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomContainer(
                                height: 30,
                                width: 130,
                                color: ElaColors.green,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: DropdownButton(
                                    value: _selectedValue,
                                    onChanged: (String? newvalue) {
                                      setState(() {
                                        _selectedValue = newvalue;
                                        _textindex = _dropDownItems
                                            .indexOf(_selectedValue!);
                                        _displayText =
                                            _displayTexts[_textindex!];
                                      });
                                    },
                                    items: _dropDownItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )),
                          ),
                          const Gap(10),
                          CustomBucketForm(
                              title: 'Title : ', controller: _titleController),
                          CustomBucketForm(
                              title: '$_displayText',
                              controller: _destinationController),
                          Row(
                            children: [
                              const Text('Final Date : ',
                                  style: ElaTextStyle.formTitle),
                              Flexible(
                                child: TextFormField(
                                    controller: _finalDateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: _finalDate != null
                                            ? '${_finalDate!.year}-${_finalDate!.month.toString().padLeft(2, '0')}-${_finalDate!.day.toString().padLeft(2, '0')}'
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
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
                          Gap(20),
                          TextFormField(
                            style: ElaTextStyle.title,
                            controller: _contentController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'Write your BucketList ',
                              border: InputBorder.none,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageAdd(
                                  image: _image1,
                                  onImageSelected: (image) {
                                    setState(() {
                                      _image1 = image;
                                    });
                                  }),
                              CustomImageAdd(
                                  image: _image2,
                                  onImageSelected: (image) {
                                    setState(() {
                                      _image2 = image;
                                    });
                                  })
                            ],
                          ),
                          InkWell(
                              onTap: () async {
                                if (_titleController.text.isNotEmpty &&
                                    _contentController.text.isNotEmpty &&
                                    _finalDate != null) {
                                  final bucket = BucketModel(
                                      title: _titleController.text.trim(),
                                      content: _contentController.text.trim(),
                                      destination:
                                          _destinationController.text.trim(),
                                      finalDate: _finalDate!,
                                      catogarynumber: _textindex,
                                      createDate: createDate,
                                      image1: _image1,
                                      image2: _image2);
                                  await addBucket(bucket: bucket);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context, true);
                                  _titleController.clear();
                                  _contentController.clear();
                                  _destinationController.clear();
                                  _finalDateController.clear();
                                  _finalDate = null;
                                  log('$_textindex');
                                } else {
                                  Navigator.pop(context);
                                  log('error');
                                }
                              },
                              child: CustomButton(
                                text: 'SAVE',
                                width: 75,
                              )),
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
      initialDateTime: DateTime.now(),
      maxDateTime: DateTime(2050),
      minDateTime: DateTime(2023),
    ).show(context);
  }
}
