part of 'auth_cubit.dart';

class AuthState {
  final UserModel? user;
  final String? message;
  // * Login states
  final bool isLoginging;
  final bool successLoginging;
  final bool errorLoginging;

  // * Register states
  final bool isRegistrating;
  final bool successRegistration;
  final bool errorRegistration;

  AuthState({
    this.user,
    this.message,
    //* login
    this.isLoginging = false,
    this.errorLoginging = false,
    this.successLoginging = false,
    //* register
    this.isRegistrating = false,
    this.errorRegistration = false,
    this.successRegistration = false,
  });

  AuthState copyWith({
    UserModel? user,
    String? message,
    bool? isLoginging,
    bool? successLoginging,
    bool? errorLoginging,
    bool? isRegistrating,
    bool? successRegistration,
    bool? errorRegistration,
  }) =>
      AuthState(
        user: user ?? this.user,
        message: message ?? this.message,
        //* login
        isLoginging: isLoginging ?? this.isLoginging,
        successLoginging: successLoginging ?? this.successLoginging,
        errorLoginging: errorLoginging ?? this.errorLoginging,
        //* register
        isRegistrating: isRegistrating ?? this.isRegistrating,
        successRegistration: successRegistration ?? this.successRegistration,
        errorRegistration: errorRegistration ?? this.errorRegistration,
      );
}
