import 'package:flutter_bloc/flutter_bloc.dart';

class TextToggleCubit extends Cubit<bool> {

  TextToggleCubit() : super(false);

  void showHideText() {
    final isToggle = state == true ? false : true;
    emit(isToggle);
  }
}