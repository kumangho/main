import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';

class ShelfLifeController extends GetxController {
  RxList<bool> isSelected = [true, false, false].obs;
  void changeTabIndex(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
    if (index == 0) {
      shelfLife = 'good';
    }
    if (index == 1) {
      shelfLife = 'danger';
    }
    if (index == 2) {
      shelfLife = 'fridged';
    }
    print(shelfLife);
    update();
  }


}
