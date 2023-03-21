import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginbloc/Services/LoginModel.dart';
import 'package:loginbloc/Services/loginRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final loginResponse = LoginApi();
  LoginBloc() : super(LoginLoadingState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        var load = await loginResponse.getLoginRepo();
        emit(LoginLoadedState(load));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
