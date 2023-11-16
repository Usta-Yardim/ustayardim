import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/widgets/category_model_widget.dart';

class ClientMainPage extends StatefulWidget {
  const ClientMainPage({super.key});

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

class _ClientMainPageState extends State<ClientMainPage> {
  TextEditingController searchController = TextEditingController();

  List<CategoryModel> _filteredList = [];
  bool _shouldShowFilteredList = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  _filter(String text) {
    if (text.isNotEmpty) {
      CategoriesHelper categoriesHelper =
          Provider.of<CategoriesHelper>(context, listen: false);
      _shouldShowFilteredList = true;
      _filteredList = categoriesHelper.categories
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      _filteredList = [];
      _shouldShowFilteredList = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            StickyHeader(
                header: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: width * 0.05),
                  color: Colors.white,
                  child: TextField(
                    controller: searchController,
                    onChanged: _filter,
                  ),
                ),
                content: Consumer<CategoriesHelper>(
                    builder: (context, categoriesHelper, child) {
                  List<CategoryModel> listToShow = _shouldShowFilteredList
                      ? _filteredList
                      : categoriesHelper.categories;

                  return listToShow.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          alignment: Alignment.center,
                          child: Text(
                            "Gösterilebilecek bir veri yok!",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        )
                      : GridView.builder(
                          itemCount: listToShow.length,
                          padding: EdgeInsets.only(
                              bottom: 30,
                              right: width * 0.05,
                              left: width * 0.05,
                              top: 20),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            CategoryModel category = listToShow[index];
                            return CategoryModelWidget(categoryModel: category);
                          },
                        );
                })),
          ],
        ),
      ),
    );
  }
}
