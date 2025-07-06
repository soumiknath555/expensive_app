import 'package:expense_app/data/helper/db_helper.dart';
import 'package:expense_app/data/model/user_model.dart';

class UserRepository {
  DBHelper dbHelper;
  UserRepository({required this.dbHelper});

  Future<String> singUpUser ({required UserModel user }) async {

    if(await dbHelper.checkIfEmailExists(email: user.email)) {
      return "Email already exist" ;
    }else {
      bool check = await dbHelper.registerUser(user: user);
      return check ? "Successful Register !!!" : "failed to Register !!" ;
    }
  }

  Future<int> athanticateUser({required String email , required String pass }) async {
     if ((await dbHelper.checkIfEmailExists(email: email))) {
       if( await dbHelper.athanticateUser(email: email, pass: pass)){
         return 1;
       }else {
         return 3;
       }
     }  else {
       return 2;
     }
  }

}