import 'dart:async';

import 'package:Akash/config/routes/page_path.dart';
import 'package:Akash/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
    ()=>context.go(PagePath.loginPage),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 170,
                  child: Image.asset('assets/image/home_logo_home.png'),
              ),
            ),
            Align(
              alignment: FractionalOffset.topRight,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: sl.get<CustomColors>().spTopGradient,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(180),
                      ),
                    ),
                  ),
                  Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      gradient: sl.get<CustomColors>().spTopGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: Container(
                alignment: Alignment.bottomLeft,
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: sl.get<CustomColors>().spBottomGradient,
                    borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
