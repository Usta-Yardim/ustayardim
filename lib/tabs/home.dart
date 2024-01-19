import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/banner_helper.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/models/banner_model.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/widgets/banner_model_widget.dart';
import 'package:ustayardim/widgets/category_model_widget.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
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
      CategoriesHelper categoriesHelper = Provider.of<CategoriesHelper>(context, listen: false);
      _shouldShowFilteredList = true;
      _filteredList = categoriesHelper.categories
          .where((element) => element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      _filteredList = [];
      _shouldShowFilteredList = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        StickyHeader(
            header: Container(
              padding: EdgeInsets.only(
                  top: padding.top + 10, bottom: 10, left: width * 0.05, right: width * 0.05),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Usta Yardım",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25, color: Color(0xff393e41)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: searchController,
                    onChanged: _filter,
                    decoration: InputDecoration(
                        hintText: "Örnek: Kombi Servisi",
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrange,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Ara",
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            content: Column(
              children: [
                Consumer<BannerHelper>(builder: (context, bannerHelper, child) {
                  return CarouselSlider.builder(
                      itemCount: bannerHelper.banners.length,
                      itemBuilder: (context, i, j) {
                        BannerModel banner = bannerHelper.banners[i];
                        return BannerModelWidget(bannerModel: banner);
                      },
                      options: CarouselOptions(viewportFraction: 1));
                }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05 + 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kategoriler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff393e41),
                    ),
                  ),
                ),
                Consumer<CategoriesHelper>(builder: (context, categoriesHelper, child) {
                  List<CategoryModel> listToShow =
                      _shouldShowFilteredList ? _filteredList : categoriesHelper.categories;

                  return listToShow.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          alignment: Alignment.center,
                          child: Text(
                            "Gösterilebilecek bir veri yok!",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      : GridView.builder(
                          itemCount: listToShow.length,
                          padding: EdgeInsets.only(
                              bottom: 30, right: width * 0.05, left: width * 0.05, top: 20),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            CategoryModel category = listToShow[index];
                            return CategoryModelWidget(categoryModel: category);
                          },
                        );
                }),
              ],
            )),
      ],
    );
  }
}
