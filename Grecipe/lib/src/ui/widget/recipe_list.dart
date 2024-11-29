import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:grecipe/src/ui/view/home_view/recipe_page.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart' hide Row;
import 'package:grecipe/src/controller/recipe_controller.dart';

recipeList() {
  final recipeController = Get.put(RecipeController(), permanent: false);
  return FutureBuilder<Recipes>(
      future: recipeController.recipe,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          recipeController.snapshots =
              snapshot; // ->> I need it to excute recipeFinder
          recipeController.recipeFinder(); // --> Causing Error
          return SizedBox(
              width: displayWidth * 0.8,
              height: displayHeight * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: recipeController.avaliableRecipe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkResponse(
                    onTap: () {recipeController.selectedRecipe.value = recipeController.selectedRecipeIndex[index];
                              Get.to(() => RecipePage(),
                                  transition: Transition.cupertino);},
                    child: Container(
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
                            width: displayWidth * 0.65,
                            child: Text(
                                ' ${recipeController.avaliableRecipe[index][1][0]}',style: TextStyle(fontSize: displayHeight * 0.015),),
                          ),
                          // SizedBox( 
                          //     width: displayWidth * 0.3,
                          //     height: 15,
                          //     child: Row(children: [
                          //       availRecipeIcons('김치'),
                          //       availRecipeIcons('쌀'),
                          //       availRecipeIcons('양파'),
                          //       availRecipeIcons('파'),
                          //     ])),
                          const Spacer(),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                              size: displayHeight * 0.03,
                            ),
                        ])));
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
