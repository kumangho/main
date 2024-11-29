import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecognitionController extends GetxController {
  XFile? _image;
  RxDouble? _imageWidth, _imageHeight;
  RxList? _recognitions;
  RxBool? _busy;
  final picker = ImagePicker();

  ImageSize(ImageInfo info) {
    _imageWidth = info.image.width.toDouble().obs;
    _imageHeight = info.image.height.toDouble().obs;
    update();
  }

  void Recognitions(List recognitions) {
    _recognitions = recognitions.obs;
    update();
  }

  void Busy(bool busy) {
    _busy = false.obs;
    update();
  }

  void PickFile(pick) {
    if (pick != null) {
      _image = XFile(pick.path);
    } else {
      print("No image Selected");
    }
    update();
  }


}
