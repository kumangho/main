import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grecipe/src/controller/image_recognition_controller.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:get/get.dart';

class FoodVisionPage extends StatelessWidget {
  final myController = Get.put(ImageRecognitionController());

  File? _image;
  List? _recognitions;
  bool? _busy;
  double? _imageWidth, _imageHeight;

  final picker = ImagePicker();

  // this function loads the model
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/label.txt",
    );
  }

  // this function detects the objects on the image
  detectObject(File image) async {
    print('hello ImagePath' + image.path);
    print('hello ImageSize' + myController.ImageSize.toString());
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4, // defaults to 0.1
        numResultsPerClass: 10, // defaults to 5
        asynch: true // defaults to true
        );
    FileImage(image)
        .resolve(const ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          myController.ImageSize(info);
        })));
    myController.Recognitions(recognitions!);
  }

  @override
  void initState() {
    _busy = true;
    loadTfModel().then((val) {
      {
        myController.Busy(_busy!);
      }
    });
  }

  // display the bounding boxes over the detected objects
  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];
    if (_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight! / _imageHeight! * screen.width;

    Color blue = Colors.blue;

    return _recognitions!.map((re) {
      return Container(
        child: Positioned(
            left: re["rect"]["x"] * factorX,
            top: re["rect"]["y"] * factorY,
            width: re["rect"]["w"] * factorX,
            height: re["rect"]["h"] * factorY,
            child: ((re["confidenceInClass"] > 0.50))
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: blue,
                      width: 3,
                    )),
                    child: Text(
                      "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        background: Paint()..color = blue,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                : Container()),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      // using ternary operator
      child: _image == null
          ? Container(
              padding: EdgeInsets.only(top: displayHeight * 0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text("아직 촬영한 기록이 없네요!",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20),),
                  Text("촬영하기를 눌러 시작하거나"),
                  Text("저장된 사진을 업로드 해보세요 :)"),
                ],
              ),
            )
          : // if not null then
          Container(child: Image.file(_image!)),
    ));

    stackChildren.addAll(renderBoxes(size));

    if (_busy == true) {
      stackChildren.add(const Center(
        child: CircularProgressIndicator(),
      ));
    }

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: mainColor,
            heroTag: "Fltbtn2",
            child: const Icon(Icons.camera_alt),
            onPressed: getImageFromCamera,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: mainColor,
            heroTag: "Fltbtn1",
            child: const Icon(Icons.photo),
            onPressed: getImageFromGallery,
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: displayHeight * 0.06,
          child: Center(
            child: Text(
              '푸드 비전',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: displayHeight * 0.02),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Stack(
            children: stackChildren,
          ),
        )
      ]),
    );
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    myController.PickFile(pickedFile);
    detectObject(_image!);
  }

  // gets image from gallery and runs detectObject
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    myController.PickFile(pickedFile);
    detectObject(File(pickedFile!.path));
  }
}
