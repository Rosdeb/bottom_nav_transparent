import 'package:bottom_bar_transparent/views/screen/app/app.dart';
import 'package:bottom_bar_transparent/views/screen/Home/home.dart';
import 'package:bottom_bar_transparent/views/screen/Notifications/notification.dart';
import 'package:get/get.dart';

import '../views/screen/Setting/setting.dart';

class BottomBar extends GetxController{
  var selectedIndex = 0.obs;
   void toggle(int index){
     selectedIndex.value = index;
     if (selectedIndex.value == 0) {
       Get.to(() => Home());
     } else if (selectedIndex.value == 1) {
       Get.to(() => App());
     } else if (selectedIndex.value == 2) { // Fixed: was 1, should be 2
       Get.to(() => Notificationes());
     } else if (selectedIndex.value == 3) { // Added missing case
      Get.to(() => Setting());
     }
     update();
   }
}