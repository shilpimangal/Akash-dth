import 'package:Akash/presenter/pages/navigation/subpage/menu_page.dart';
import 'package:Akash/presenter/pages/navigation/subpage/settings_page.dart';
import 'package:Akash/presenter/pages/navigation/subpage/chat_page.dart';
import 'package:Akash/presenter/pages/navigation/subpage/home_page.dart';
import 'package:Akash/presenter/pages/navigation/subpage/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme/custom_colors.dart';
import '../../../di/injection_container.dart';
import '../../logic/navigation/navigation_cubit.dart';
import 'app_bar.dart';
import 'custom_bottom_navigation_bar.dart';
import 'custom_drawer.dart';
import 'nav_bar_items.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AkashAppBar(),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return SafeArea(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: sl.get<CustomColors>().bottomTabBG,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: CustomBottomNavigationBar(
                      currentIndex: state.index,
                      onTap: (index) {
                        if (index == 0) {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavBarItem(NavbarItem.Settings);
                        } else if (index == 1) {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavBarItem(NavbarItem.Chat);
                        } else if (index == 2) {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavBarItem(NavbarItem.Home);
                        } else if (index == 3) {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavBarItem(NavbarItem.Tutorial);
                        } else if (index == 4) {
                          BlocProvider.of<NavigationCubit>(context)
                              .getNavBarItem(NavbarItem.Menu);
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          }
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.Settings) {
              return const SettingsPage();
            } else if (state.navbarItem == NavbarItem.Chat) {
              return const ChatPage();
            } else if (state.navbarItem == NavbarItem.Home) {
              return const HomePage();
            } else if (state.navbarItem == NavbarItem.Tutorial) {
              return const TutorialPage();
            } else if (state.navbarItem == NavbarItem.Menu) {
              return const MenuPage();
            }
            return Container();
          }),
    );
  }
}
