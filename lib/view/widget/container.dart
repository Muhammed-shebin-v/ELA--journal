import 'package:new_ela/view/theme/app_color.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final Widget child;
  final bool boxshadow;
  final double? width;
  final dynamic color;
  const CustomContainer({
    super.key,
    required this.child,
    this.color=ElaColors.white,
    this.height,
    this.boxshadow = false,
    this.width

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height:height,
      decoration: BoxDecoration(
        border: Border.all(width: 0.7),
        borderRadius: BorderRadius.circular(30),
        color: color,
        boxShadow: boxshadow
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
