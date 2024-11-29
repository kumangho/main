import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  File? pickedImageFile;
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    pickedImageFile = File(pickedImage!.path);
    update();
  }

  void Function() get pickImage => _pickImage;
}
