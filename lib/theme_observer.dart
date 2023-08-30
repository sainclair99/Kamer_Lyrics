import 'package:bloc/bloc.dart';

class ThemeObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change.toString());
  }
}
