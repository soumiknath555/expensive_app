import 'package:expense_app/data/repository/user_repository.dart';
import 'package:expense_app/ui/sing_up/bloc/user_event.dart';
import 'package:expense_app/ui/sing_up/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserRepository userRepository;
  UserBloc({required this.userRepository}): super(UserInitialState()){
    on<SingUpEvent>((event , emit) async {
        emit(UserLoadingState());
        
        String msg = await userRepository.singUpUser(user: event.user);

        print(msg);
        if(msg == "Successfully Register!!"){
          emit(UserSuccessState());
        }else{
          emit(UserFailureState(errorMsg: msg));
        }
    });

    on <LoginEvent>((event , emit) async {
      emit(UserLoadingState());

      int msg = await userRepository.athanticateUser(email: event.email, pass: event.pass);
      
      if (msg == 1) {


        emit (UserSuccessState());
      }  else if (msg == 2) {
        emit(UserFailureState(errorMsg: "Email does not exist"));
      } else {
        emit (UserFailureState(errorMsg: "Password does not match"));
      }
      
    });
  }
}