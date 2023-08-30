import 'package:bloc/bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({
    required this.authRepository,
  }) : super(AuthState());

  //* Login States emitted
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

  //* Register States emitted
  register({
    required name,
    required email,
    required password,
  }) async {
    try {
      emit(
        state.copyWith(
          isRegistering: true,
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
          isRegistering: false,
          successRegistration: true,
          errorRegistration: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isRegistering: false,
          successRegistration: false,
          errorRegistration: true,
          message: e.toString(),
        ),
      );
    }
  }

  // * logout states emitted
  logout() async {
    try {
      emit(
        state.copyWith(
          isDisconnecting: true,
          successDisconnection: false,
          errorDisconnection: false,
        ),
      );

      await authRepository.logout();

      emit(
        state.copyWith(
          isDisconnecting: false,
          successDisconnection: true,
          errorDisconnection: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDisconnecting: false,
          successDisconnection: false,
          errorDisconnection: true,
          message: e.toString(),
        ),
      );
    }
  }

  // * Init States emitted
  checkAuthState() async {
    try {
      emit(
        state.copyWith(
          isCheckingAuthState: true,
          successCheckingAuthState: false,
          errorCheckingAuthState: false,
        ),
      );

      var user = await authRepository.getUser();

      emit(
        state.copyWith(
          user: user,
          isCheckingAuthState: false,
          successCheckingAuthState: true,
          errorCheckingAuthState: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          isCheckingAuthState: false,
          successCheckingAuthState: false,
          errorCheckingAuthState: true,
        ),
      );
    }
  }
}
