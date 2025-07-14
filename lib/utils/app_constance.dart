import 'package:expense_app/data/model/cat_model.dart';

class AppConstance {

  static const String PREF_USER_ID_KEY = "uid";

  static List<CatagoryModel> mCatList = [
    CatagoryModel(catId: 1, catName: "Income", catIamge: "assets/images/capital-gain.png"),
    CatagoryModel(catId: 2, catName: "Internet", catIamge: "assets/images/internet.png"),
    CatagoryModel(catId: 3, catName: "Food", catIamge: "assets/images/fast-food.png"),
    CatagoryModel(catId: 4, catName: "Shopping", catIamge: "assets/images/shopping.png"),
    CatagoryModel(catId: 5, catName: "Travel", catIamge: "assets/images/travel.png"),
    CatagoryModel(catId: 6, catName: "Education", catIamge: "assets/images/education.png"),
    CatagoryModel(catId: 7, catName: "Rent", catIamge: "assets/images/rent.png"),
    CatagoryModel(catId: 8, catName: "Health", catIamge: "assets/images/health.png"),
    CatagoryModel(catId: 9, catName: "Petrol", catIamge: "assets/images/petrol.png"),
    CatagoryModel(catId: 10, catName: "Other", catIamge: "assets/images/other.png"),
  ];
  
}