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

  // * Init States
  final bool isCheckingAuthState;
  final bool successCheckingAuthState;
  final bool errorCheckingAuthState;

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
    //* init
    this.isCheckingAuthState = false,
    this.successCheckingAuthState = false,
    this.errorCheckingAuthState = false,
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
    bool? isCheckingAuthState,
    bool? successCheckingAuthState,
    bool? errorCheckingAuthState,
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
        //* init
        isCheckingAuthState: isCheckingAuthState ?? this.isCheckingAuthState,
        successCheckingAuthState:
            successCheckingAuthState ?? this.successCheckingAuthState,
        errorCheckingAuthState:
            errorCheckingAuthState ?? this.errorCheckingAuthState,
      );
}
