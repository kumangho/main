import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/view/intro_view/loading_page.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:camera/camera.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grecipe/src/data/model/ingredient.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientAdapter());
  await Hive.openBox<DataModel>('dbs');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    displayWidth = Get.width;
    displayHeight = Get.height;
    displayRatio = displayHeight / displayWidth;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const LoadingPage(),
    );
  }
}
