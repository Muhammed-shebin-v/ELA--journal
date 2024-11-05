import 'package:new_ela/controllers/mood_function.dart';
import 'package:new_ela/model/mood/mood_model.dart';
import 'package:new_ela/view/theme/app_color.dart';
import 'package:new_ela/view/widget/snackbar.dart';
import 'package:flutter/material.dart';

class CustomEmojiIcon extends StatelessWidget {
  final String imagepath;
  final dynamic customcolor;
  final String mood;
  final dynamic ctx;

  final  DateTime _currentdate=DateTime.now();
  CustomEmojiIcon({super.key,required this.ctx, required this.imagepath,required this.customcolor,required this.mood});
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          _save(mood: mood);
        },
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(5),
              color: customcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ImageIcon(AssetImage(imagepath)),
            )),
      ),
    );
  }

  Future<void>_save({required mood}) async{
    MoodModel savingmood=MoodModel(date: _currentdate, mood: mood);
    await saveMood(mood:savingmood);
    customSnackBar(ctx: ctx, text: 'Mood $mood saved!!',color: ElaColors.green);
  }
}
