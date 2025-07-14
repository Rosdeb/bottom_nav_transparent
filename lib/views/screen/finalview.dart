import 'dart:ui';

import 'package:bottom_bar_transparent/controller/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:get/get.dart';

class Finalview extends StatefulWidget {
  Finalview({super.key});

  @override
  State<Finalview> createState() => _FinalviewState();
}

final BottomBar controller = Get.put(BottomBar());

class _FinalviewState extends State<Finalview> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Blurred Bottom Navigation Bar")),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(12),
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 50,
            itemBuilder: (context, index) {
              return Card(
                color: theme.primaryColor,
                child: Column(
                  children: [
                    const Icon(Icons.person, color: Colors.white, size: 40),

                    const SizedBox(height: 10),
                    Text(
                      "FlexZ",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "CodeWithFlexz",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            height: 86,
            child: AnimatedContainer(
              duration: Duration(microseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(52),
                  bottomRight: Radius.circular(52),
                ),
                color: theme.scaffoldBackgroundColor.withOpacity(0.3),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(52),
                    bottomRight: Radius.circular(52)),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
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
            bottom: 16,
            left: 20,
            right: 20,
            height: 86,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [

                buildBNBitem(Icons.home_outlined, 0),
                buildBNBitem(Icons.apps, 1),
                buildBNBitem(Icons.notifications_outlined, 2),
                buildBNBitem(Icons.settings_outlined, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBNBitem(IconData icon, int index) {
    return Obx(() {
      final isSelected = controller.selectedIndex == index;

      return ZoomTapAnimation(
        onTap: () => controller.toggle(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.amberAccent : Colors.white,
            size: isSelected ? 32 : 29,
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
    final double left = 16;
    final double top = 16;
    final double right = size.width - 16;
    final double bottom = size.height - 16;

    final double topRadius = 24;      // close to your 24 px radius for top corners
    final double bottomRadius = 52;   // 52 px radius for bottom corners

    Path path = Path();

// Move to start point: left side, just below top-left corner radius
    path.moveTo(left, top + topRadius);

// Draw top-left rounded corner (quadratic curve to top edge)
    path.quadraticBezierTo(left, top, left + topRadius * 1.5, top);

// Draw top edge line to just before top-right corner
    path.lineTo(right - topRadius * 1.5, top);

// Draw top-right rounded corner (quadratic curve)
    path.quadraticBezierTo(right, top, right, top + topRadius);

// Draw right edge line down to before bottom-right corner
    path.lineTo(right, bottom - bottomRadius);

// Draw bottom-right rounded corner
    path.quadraticBezierTo(right, bottom, right - bottomRadius, bottom);

// Draw bottom edge line to before bottom-left corner
    path.lineTo(left + bottomRadius, bottom);

// Draw bottom-left rounded corner
    path.quadraticBezierTo(left, bottom, left, bottom - bottomRadius);

// Close path back to start
    path.lineTo(left, top + topRadius);

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
