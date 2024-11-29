import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudFireStoreController extends GetxController {
  Future readData() async {
    var _fireStore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await _fireStore.collection('COOKRCP').get();
    return snapshot.docs;
  }
}
