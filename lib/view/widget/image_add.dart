import 'package:new_ela/controllers/user_functions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageAdd extends StatefulWidget {
  dynamic image;
  final Function(dynamic) onImageSelected;
  CustomImageAdd({super.key, required this.image,required this.onImageSelected});

  @override
  State<CustomImageAdd> createState() => _CustomImageAddState();
}

class _CustomImageAddState extends State<CustomImageAdd> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          widget.image = await pickSaveImage();
          setState((){
          });
          widget.onImageSelected(widget.image);
        },
        child: Container(
            width: 150,
            height: 190,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1),
              border: Border.all(width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: widget.image == null
                  ? const Placeholder()
                  : Image.memory(
                      widget.image!,
                      fit:BoxFit.cover,
                    ),
            )),
      ),
    );
  }
}
