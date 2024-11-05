import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:new_ela/view/theme/app_color.dart';
import '../calender.dart';
import '../goals.dart';
import '../home.dart';
import '../user_details.dart';
import '../write.dart';
import 'package:flutter/material.dart';

class Notchbar extends StatefulWidget {
  const Notchbar({super.key});

  @override
  NotchbarState createState() => NotchbarState();
}

class NotchbarState extends State<Notchbar> {
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 2);
  final List<Widget> _pages = [
    const Write(),
    const Calender(),
    const HomeScreeen(),
    const Goals(),
    const UserDetails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElaColors.white,
      body: _pages[_controller.index],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem:
                Image(image: AssetImage('assets/icons/pencil.png')),
            activeItem: Image(image: AssetImage('assets/icons/pencil.png')),
          ),
          BottomBarItem(
            inActiveItem:
                Image(image: AssetImage('assets/icons/calendar.png')),
            activeItem:
                Image(image: AssetImage('assets/icons/calendar.png')),
          ),
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/icons/home.png')),
            activeItem: Image(image: AssetImage('assets/icons/home.png')),
          ),
          BottomBarItem(
            inActiveItem:
                Image(image: AssetImage('assets/icons/stats.png')),
            activeItem: Image(image: AssetImage('assets/icons/stats.png')),
          ),
          BottomBarItem(
              inActiveItem: Image(
                image: AssetImage('assets/icons/user.png'),
                width: 100,
                height: 100,
              ),
              activeItem:
                  Image(image: AssetImage('assets/icons/user.png'))),
        ],
        onTap: (index) {
          setState(() {
            _controller.index = index;
          });
        },
        kIconSize: 25,
        kBottomRadius: 40,
        bottomBarHeight: 60,
        color:const Color.fromARGB(255, 229, 228, 228) ,
        notchColor: const Color.fromRGBO(194, 246, 58, 1),
        shadowElevation: 5,
        showTopRadius: true,
      ),
    );
  }
}
