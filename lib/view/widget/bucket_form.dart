import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomBucketForm extends StatefulWidget {
  final String title;
  final dynamic controller;
  const CustomBucketForm(
      {super.key, required this.title, required this.controller});

  @override
  State<CustomBucketForm> createState() => _CustomBucketFormState();
}

class _CustomBucketFormState extends State<CustomBucketForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title, style: ElaTextStyle.formTitle),
        Flexible(
            child: TextFormField(
          controller: widget.controller,
          decoration: const InputDecoration(
            hintStyle: ElaTextStyle.smallSubTitle,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        )),
      ],
    );
  }
}
