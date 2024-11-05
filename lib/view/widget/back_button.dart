import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final dynamic ctx;
  const CustomBackButton({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(ctx);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: 35,
    );
  }
}
