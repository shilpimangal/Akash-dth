import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/navigation/nav_bar_items.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.Settings, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.Settings:
        emit(NavigationState(NavbarItem.Settings, 0));
        break;
      case NavbarItem.Chat:
        emit(NavigationState(NavbarItem.Chat, 1));
        break;
      case NavbarItem.Home:
        emit(NavigationState(NavbarItem.Home, 2));
        break;
      case NavbarItem.Tutorial:
        emit(NavigationState(NavbarItem.Tutorial, 3));
        break;
      case NavbarItem.Menu:
        emit(NavigationState(NavbarItem.Menu, 4));
        break;
    }
  }
}