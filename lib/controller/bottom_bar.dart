import 'package:get/get.dart';

class BottomBar extends GetxController{
  var selectedIndex = 0.obs;
   void toggle(int index){
     selectedIndex.value = index;
   }
}