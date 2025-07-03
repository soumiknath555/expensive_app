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

        if(msg == "Successfully Register!!"){
          emit(UserSuccessState());
        }else{
          emit(UserFailureState(errorMsg: msg));
        }
    });
  }
}