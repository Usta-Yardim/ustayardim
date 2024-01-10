import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/models/banner_model.dart';

class BannerHelper extends ChangeNotifier{
  List<BannerModel> banners = [];

  BannerHelper(){
    _getBanners();
  }


  _getBanners(){
    banners = [
      BannerModel(photoUrl: "https://www.shutterstock.com/image-vector/advertising-blank-banner-repairman-service-250nw-1525108640.jpg", title: "İndirim")
      ,BannerModel(photoUrl: "https://www.shutterstock.com/image-vector/advertising-blank-banner-repairman-service-250nw-1525108640.jpg", title: "Büyük İndirim")
    ];
    notifyListeners();
  }

}