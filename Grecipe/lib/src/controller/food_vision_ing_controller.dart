import 'package:get/get.dart';
import 'dart:io';

class FoodVisionIngController extends GetxController {
  RxList recgResult = [].obs;
  RxList fvingResult = [].obs;
  RxString fvSelectedIcon = '달걀'.obs;
  RxInt fvSelectedIndex = 0.obs;
  File? fvImage;

  createFvIng() {
    fvingResult.add(fvSelectedIcon.value);
    update();
  }

  updateFvIng(index) {
    fvingResult[index] = fvSelectedIcon.value;
    update();
  }

  deleteFvIng(index) {
    fvingResult.removeAt(index);
    update();
  }




}
