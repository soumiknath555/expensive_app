import 'package:expense_app/data/model/user_model.dart';

abstract class UserEvent{}


class SingUpEvent extends UserEvent{
  UserModel user ;
  SingUpEvent({required this.user});
}

class LoginEvent extends UserEvent{
  String email;
  String pass;
  LoginEvent({required this.email,required this.pass});
}

