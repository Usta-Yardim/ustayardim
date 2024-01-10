import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/screens/client/category_repairmans_screen.dart';

class CategoryModelWidget extends StatelessWidget {
  const CategoryModelWidget({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigatorHelper.push(destination: CategoryRepairmansScreen(categoryModel: categoryModel));
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                categoryModel.photoUrl,
                /*loadingBuilder: (context, child, event) {
                  if (event == null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: child,
                    );
                  }
                  return Container(
                    width: width * 0.18,
                    height: width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  );
                },*/
                fit: BoxFit.cover,
                width: width * 0.18,
                height: width * 0.18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Spacer(),
            Text(
              categoryModel.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
