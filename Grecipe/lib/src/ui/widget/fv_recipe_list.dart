import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:grecipe/src/ui/view/foodvision_view/fv_recipe_page.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart' hide Row;
import 'package:grecipe/src/controller/fv_recipe_controller.dart';

fvrecipeList() {
  final fvrecipeController =
      Get.put(FoodVisionRecipeController(), permanent: false);
  return FutureBuilder<Recipes>(
      future: fvrecipeController.recipe,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          fvrecipeController.snapshots =
              snapshot; // ->> I need it to excute recipeFinder
          fvrecipeController.recipeFinder(); // --> Causing Error
          //print('here ${fvrecipeController.fvavaliableRecipe}');
          return SizedBox(
              width: displayWidth * 0.8,
              height: displayHeight * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: fvrecipeController.fvavaliableRecipe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: displayWidth * 0.1,
                        height: displayHeight * 0.05,
                        margin: EdgeInsets.only(bottom: displayHeight * 0.01),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: subColor,
                          border: Border.all(color: mainColor, width: 2),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: displayWidth * 0.6,
                            child: Text(
                                ' ${fvrecipeController.fvavaliableRecipe[index][1][0]}'),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              fvrecipeController.fvselectedRecipe.value =
                                  fvrecipeController.fvselectedRecipeIndex[index];
                              Get.to(() => foodVisionRecipePage(),
                                  transition: Transition.cupertino);
                            },
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          )
                        ]));
                  }));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      });
}

availRecipeIcons(ingredients) {
  return Image.asset(
    "assets/images/icons/ingredient_icon/$ingredients.png",
    height: 15,
    width: 15,
  );
}
