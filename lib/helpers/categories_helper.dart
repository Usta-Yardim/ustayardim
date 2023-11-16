import 'package:flutter/cupertino.dart';
import 'package:ustayardim/models/category_model.dart';

class CategoriesHelper extends ChangeNotifier{
  List<CategoryModel> categories = [];


  CategoriesHelper(){
    getCategories();
  }
  
  getCategories(){
    categories = [
      CategoryModel(id: "dsadasdasdasdasd", name: "Apartman Temizliği", photoUrl: "assets/images/categories/apartman-temizligi.png"),
      CategoryModel(id: "vfsfdsdsaafsfewq", name: "Ayakkabı Tamiri", photoUrl: "assets/images/categories/ayakkabi-tamiri.png"),
      CategoryModel(id: "dasdasdasdsadade", name: "Beyaz Eşya Servisi", photoUrl: "assets/images/categories/beyaz-esya-servisi.png"),
      CategoryModel(id: "dsadasgfjgfdasda", name: "Boya Badana", photoUrl: "assets/images/categories/boya-badana.png"),
      CategoryModel(id: "vfsfdsdhfsafsfeq", name: "Çatı Kaplama", photoUrl: "assets/images/categories/cati-kaplama.png"),
      CategoryModel(id: "dasdasdhfsadadwq", name: "Doğalgaz Tesisatı", photoUrl: "assets/images/categories/dogalgaz-tesisati.png"),
      CategoryModel(id: "dsadasdashfgdasd", name: "Ev Temizliği", photoUrl: "assets/images/categories/ev-temizligi.png"),
      CategoryModel(id: "vfsfdsdsaghfafsf", name: "Evden Ev Nakliyat", photoUrl: "assets/images/categories/evden-eve-nakliyat.png"),
      CategoryModel(id: "dasdasddasdadsad", name: "Halı Yıkama", photoUrl: "assets/images/categories/hali-yikama.png"),
      CategoryModel(id: "dsadasadahgfsdas", name: "Klima Servisi", photoUrl: "assets/images/categories/klima-servisi.png"),
      CategoryModel(id: "vfsfdsahgfdsafsf", name: "Kombi Servisi", photoUrl: "assets/images/categories/kombi-servisi.png"),
      CategoryModel(id: "dasdasjfdsadadss", name: "Parkeci", photoUrl: "assets/images/categories/parkeci.png"),
      CategoryModel(id: "dasdasjhkjhjadss", name: "Su Tesisatçısı", photoUrl: "assets/images/categories/su-tesisatcisi.png"),
      CategoryModel(id: "dasd8ı78ı9dsadss", name: "Tesisat", photoUrl: "assets/images/categories/tesisat.jpg"),
      CategoryModel(id: "dasdasjmnbadadss", name: "TV Tamiri", photoUrl: "assets/images/categories/tv-tamiri.png"),
    ];
  }

}