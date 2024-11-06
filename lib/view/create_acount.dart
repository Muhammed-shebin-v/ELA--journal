import 'dart:developer';
import 'dart:typed_data';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/theme/app_textstyle.dart';
import 'package:new_ela/view/widget/container.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:new_ela/view/widget/snackbar.dart';
import '../controllers/user_functions.dart';
import 'widget/notchbar.dart';
import 'package:flutter/material.dart';
import '../model/user/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  Uint8List? _imagebytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              const Gap(100),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create\nAccount',
                    style: ElaTextStyle.heading,
                  )),
              const Gap(20),
              CustomContainer(
                color: ElaColors.lightgrey,
                boxshadow: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            _imagebytes = await pickSaveImage();
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 180,
                            width: 180,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: _imagebytes == null
                                    ? const Image(
                                        image:
                                            AssetImage('assets/icons/user.png'))
                                    : Image.memory(
                                        _imagebytes!,
                                        fit: BoxFit.fill,
                                      )),
                          ),
                        ),
                        const Gap(30),
                        TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                num.tryParse(value) != null ||
                                value.length < 3) {
                              return 'enter valid name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: const Color.fromRGBO(245, 255, 210, 1),
                              labelText: 'Username',
                              labelStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 137, 136, 136)),
                              filled: true),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _address,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                num.tryParse(value) != null) {
                              return 'enter valid Address';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: const Color.fromRGBO(245, 255, 210, 1),
                              labelText: 'Address',
                              labelStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 137, 136, 136)),
                              filled: true),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _dob,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            fillColor: const Color.fromRGBO(245, 255, 210, 1),
                            labelText: 'Date of Birth',
                            labelStyle: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 137, 136, 136)),
                            filled: true,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_month_outlined),
                              onPressed: () {
                                _pickDate();
                              },
                            ),
                          ),
                          readOnly: true,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                num.tryParse(value) == null ||
                                value.length != 10) {
                              return 'enter valid Number';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: const Color.fromRGBO(245, 255, 210, 1),
                              labelText: 'Phone',
                              labelStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 137, 136, 136)),
                              filled: true,
                              focusColor: Colors.black),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 260,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(194, 246, 58, 1)),
                            onPressed: () async {
                              if (_dob.text.isNotEmpty) {
                                if (formkey.currentState!.validate()) {
                                  await onaddUser();
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Notchbar()));
                                }
                              } else {
                                customSnackBar(
                                    ctx: context,
                                    text: 'add your BirtDate',
                                    color: ElaColors.red);
                              }
                            },
                            child: const Text('Create',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onaddUser() async {
    final name = _name.text.trim();
    final address = _address.text.trim();
    final dob = _dob.text.trim();
    final phone = _phone.text.trim();
    final image = _imagebytes;

    final user = UserModel(
        name: name,
        address: address,
        dob: dob,
        phone: int.parse(phone),
        image: image);

    await addUser(user: user);
  }

  void _pickDate() {
    BottomPicker.date(
      pickerTitle: const Text(
        'Select your birthday',
      ),
      onSubmit: (date) {
        try {
          String formattedDate = DateFormat('yyyy-MM-dd').format(date);
          _dob.text = formattedDate;
        } catch (e) {
          log('Error formatting date: $e');
        }
      },
      bottomPickerTheme: BottomPickerTheme.blue,
      initialDateTime: DateTime.now(),
      maxDateTime: DateTime.now(),
    ).show(context);
  }
}
