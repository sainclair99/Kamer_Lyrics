import 'package:bloc/bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({
    required this.authRepository,
  }) : super(AuthState());

  //* Login function
  login({
    required email,
    required password,
  }) async {
    try {
      emit(
        state.copyWith(
          isLoginging: true,
          successLoginging: false,
          errorLoginging: false,
        ),
      );

      var user = await authRepository.login(
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          user: user,
          isLoginging: false,
          successLoginging: true,
          errorLoginging: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoginging: false,
          successLoginging: false,
          errorLoginging: true,
          message: e.toString(),
        ),
      );
    }
  }

  //* Register function
  register({
    required name,
    required email,
    required password,
  }) async {
    try {
      emit(
        state.copyWith(
          isRegistrating: true,
          successRegistration: false,
          errorRegistration: false,
        ),
      );

      var user = await authRepository.register(
        name: name,
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          user: user,
          isRegistrating: false,
          successRegistration: true,
          errorRegistration: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isRegistrating: false,
          successRegistration: false,
          errorRegistration: true,
          message: e.toString(),
        ),
      );
    }
  }
}
