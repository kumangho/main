import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommunityRecipeAddController extends GetxController {
  var tabIndex = 0.obs;
  var selectedImagePath = ''.obs;
  RxString title = ''.obs;
  Future pickImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }
}
