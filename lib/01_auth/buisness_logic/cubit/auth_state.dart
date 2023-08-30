part of 'auth_cubit.dart';

class AuthState {
  final UserModel? user;
  final String? message;
  // * Login states
  final bool isLoginging;
  final bool successLoginging;
  final bool errorLoginging;

  // * Register states
  final bool isRegistering;
  final bool successRegistration;
  final bool errorRegistration;

  // * Logout states
  final bool isDisconnecting;
  final bool successDisconnection;
  final bool errorDisconnection;

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
    this.isRegistering = false,
    this.errorRegistration = false,
    this.successRegistration = false,
    //* logout
    this.isDisconnecting = false,
    this.successDisconnection = false,
    this.errorDisconnection = false,
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
    bool? isRegistering,
    bool? successRegistration,
    bool? errorRegistration,
    bool? isDisconnecting,
    bool? successDisconnection,
    bool? errorDisconnection,
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
        isRegistering: isRegistering ?? this.isRegistering,
        successRegistration: successRegistration ?? this.successRegistration,
        errorRegistration: errorRegistration ?? this.errorRegistration,
        //* logout
        isDisconnecting: isDisconnecting ?? this.isDisconnecting,
        successDisconnection: successDisconnection ?? this.successDisconnection,
        errorDisconnection: errorDisconnection ?? this.errorDisconnection,
        //* init
        isCheckingAuthState: isCheckingAuthState ?? this.isCheckingAuthState,
        successCheckingAuthState:
            successCheckingAuthState ?? this.successCheckingAuthState,
        errorCheckingAuthState:
            errorCheckingAuthState ?? this.errorCheckingAuthState,
      );
}
