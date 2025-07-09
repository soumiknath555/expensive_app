import 'package:expense_app/data/model/cat_model.dart';

class AppConstance {

  static const String PREF_USER_ID_KEY = "uid";

  List<CatagoryModel> mCatList = [
    CatagoryModel(id: 1, catName: "Income", catIamge: "assets/images/capital-gain.png"),
    CatagoryModel(id: 2, catName: "Internet", catIamge: "assets/images/internet.png"),
    CatagoryModel(id: 3, catName: "Food", catIamge: "assets/images/fast-food.png"),
    CatagoryModel(id: 4, catName: "Shopping", catIamge: "assets/images/shopping.png"),
    CatagoryModel(id: 5, catName: "Travel", catIamge: "assets/images/travel.png"),
    CatagoryModel(id: 6, catName: "Education", catIamge: "assets/images/education.png"),
    CatagoryModel(id: 7, catName: "Rent", catIamge: "assets/images/rent.png"),
    CatagoryModel(id: 8, catName: "Health", catIamge: "assets/images/health.png"),
    CatagoryModel(id: 9, catName: "Petrol", catIamge: "assets/images/petrol.png"),
    CatagoryModel(id: 10, catName: "Other", catIamge: "assets/images/other.png"),
  ];
  
}