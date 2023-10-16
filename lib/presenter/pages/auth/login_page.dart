import 'package:Akash/config/routes/page_path.dart';
import 'package:Akash/data/model/auth/auth_dto.dart';
import 'package:Akash/presenter/helper/button_widget.dart';
import 'package:Akash/presenter/helper/text_form_field_widget.dart';
import 'package:Akash/presenter/helper/text_widget.dart';
import 'package:Akash/presenter/logic/auth/auth_cubit.dart';
import 'package:Akash/presenter/logic/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/helper/constants.dart';
import '../../../di/injection_container.dart';
import '../../helper/common_widget.dart';
import '../../helper/info_bottom_sheet.dart';
import '../../logic/common/text_toggle_cubit.dart';

class LoginPage extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController subIdController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonWidget commonWidget = sl.get<CommonWidget>();
    final TextWidget textWidget = sl.get<TextWidget>();
    final ButtonWidget buttonWidget = sl.get<ButtonWidget>();
    final TextFormFieldWidget textFormFieldWidget = sl.get<TextFormFieldWidget>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl.get<AuthCubit>(),
        ),
        BlocProvider<TextToggleCubit>(
          create: (context) => sl.get<TextToggleCubit>(),
        ),
      ],
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Icon(
                      Icons.icecream,
                      size: 100,
                    ),
                    const SizedBox(height: 30),
                    const Text("SIGN IN"),
                    const SizedBox(height: 30),
                    textFormFieldWidget.textFormField(
                        context,
                        "Sub ID",
                        subIdController,
                        Icons.info,
                        'Enter a valid SubId',
                        TextInputType.number, onClickEvent),
                    const SizedBox(height: 20),
                    textFormFieldWidget.passwordTextFormField(
                        context,
                        "Pin",
                        pinController,
                        "Enter correct Pin.",
                        TextInputType.number),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        context.push(PagePath.forgotPinPage);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text("Forgot MyAKASH PIN?"),
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                      if (state is AuthInitialState ||
                          state is AuthErrorState) {
                        return buttonWidget.rectangularButton(context,
                            "SIGN IN", Colors.blueAccent, Colors.white,
                            actionTypeMainBtn, onClickEvent);
                      } else if (state is AuthLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container();
                    }, listener: (context, state) {
                      if (state is AuthErrorState) {
                        commonWidget.showErrorDialog(
                            context,
                            "Api Error",
                            state.error?.response?.statusMessage ??
                                errorMessage,
                            state.error?.response?.statusCode ?? -1);
                      } else if (state is AuthCompletedState) {
                        //navigate to home screen
                        context.go(PagePath.navigationPage);
                      }
                    }),
                    const SizedBox(height: 30),
                    const Text("or"),
                    const SizedBox(height: 10),
                    buttonWidget.textButton(context, "Join as a Guest",
                        Colors.blueAccent, actionTypeGuestUserButton, onClickEvent),
                    const SizedBox(height: 50),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: textWidget.rowWithTwoText(
                            context,
                            MainAxisAlignment.center,
                            "Don't have an account? ",
                            "Sign Up",
                            Colors.black87,
                            Colors.blueAccent,
                            actionTypeBottomSignUpButton,
                            onClickEvent
                        ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }

  void onClickEvent(BuildContext context, String actionType) {
    if (actionType == actionTypeMainBtn) {
      if (formGlobalKey.currentState!.validate()) {
        formGlobalKey.currentState?.save();
        AuthDto authDto =
            AuthDto(subId: subIdController.text, pin: pinController.text);
        BlocProvider.of<AuthCubit>(context).appAuthentication(authDto);
      }
    } else if (actionType == actionTypeTextFormField) {
      sl.get<InfoBottomSheet>().showInfoBottomSheet(
          context, subIdAlertInfoMessage, Icons.info, Colors.red);
    } else if (actionType == actionTypeGuestUserButton) {
      context.push(PagePath.navigationPage);
    } else if (actionType == actionTypeBottomSignUpButton) {
      context.push(PagePath.registerPage);
    }
  }
}
