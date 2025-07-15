import 'dart:ui';

import 'package:bottom_bar_transparent/controller/bottom_bar.dart';
import 'package:bottom_bar_transparent/views/screen/Setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'Home/home.dart';
import 'Notifications/notification.dart';

class Finalview extends StatefulWidget {
  Finalview({super.key});

  @override
  State<Finalview> createState() => _FinalviewState();
}

final BottomBar controller = Get.put(BottomBar());

class _FinalviewState extends State<Finalview> {


  Widget getCurrentPage() {
    switch (controller.selectedIndex.value) {
      case 0:
        return Home();
      case 1:
        return App();
      case 2:
        return Notificationes();
      case 3:
        return Setting();
      // Make sure you have this page
      default:
        return Home();
    }
  }
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Obx(() => getCurrentPage()),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 70,
            child: AnimatedContainer(
              duration: Duration(microseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color:theme.primaryColor.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 1),
                      ),
                    ),
                  ),
                ),


              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [

                buildBNBitem(Icons.home_outlined, 0,"Home"),
                buildBNBitem(Icons.apps,1, "App"),
                buildBNBitem(Icons.notifications_outlined, 2,"Notification"),
                buildBNBitem(Icons.settings_outlined, 3,"Setting"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBNBitem(IconData icon, int index,String text) {
    return Obx(() {
      final isSelected = controller.selectedIndex == index;

      return ZoomTapAnimation(
        onTap: () => controller.toggle(index),
        child: Container(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ?Color(0xFF06923E) : Color(0xFFD3ECCD),
                size: isSelected ? 25 : 28,
              ),
              Text(text,style: TextStyle(fontSize:isSelected? 12 : 12.5,fontWeight: FontWeight.w500,color: isSelected ? Color(0xFF437057) : Colors.black),),

            ],
          ),
        ),
      );
    });
  }
}

  class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(64, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;


    // path.close();
    // return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
