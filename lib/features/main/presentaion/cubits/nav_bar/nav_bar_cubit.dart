import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(index);
  }
}
