import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/routes/page_path.dart';
import '../../../core/helper/constants.dart';
import '../../../di/injection_container.dart';
import '../../helper/button_widget.dart';
import '../../helper/info_bottom_sheet.dart';
import '../../helper/text_form_field_widget.dart';
import '../../helper/text_widget.dart';

class RegisterPage extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController subIdController = TextEditingController();
  final TextEditingController rmnController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextWidget textWidget = sl.get<TextWidget>();
    final ButtonWidget buttonWidget = sl.get<ButtonWidget>();
    final TextFormFieldWidget textFormFieldWidget = sl.get<TextFormFieldWidget>();

    return Scaffold(
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
                    const Text("SIGN UP"),
                    const SizedBox(height: 30),
                    textFormFieldWidget.textFormField(
                        context,
                        "Sub ID",
                        subIdController,
                        Icons.info,
                        'Enter a valid SubId',
                        TextInputType.number, onClickEvent),
                    const SizedBox(height: 20),
                    textFormFieldWidget.textFormField(
                        context,
                        "RMN (Registered Mobile Number)",
                        subIdController,
                        null,
                        'Enter a valid RMN',
                        TextInputType.number, onClickEvent),
                    const SizedBox(height: 50),
                    buttonWidget.rectangularButton(
                        context, "SIGN UP", Colors.blueAccent, Colors.white,
                        actionTypeMainBtn, onClickEvent),
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
                            "Already have an account? ",
                            "Sign In",
                            Colors.black87,
                            Colors.blueAccent,
                            actionTypeBottomSignInButton, onClickEvent)
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickEvent(BuildContext context, String actionType) {
    if (actionType == actionTypeTextFormField) {
      sl.get<InfoBottomSheet>().showInfoBottomSheet(
          context, subIdAlertInfoMessage, Icons.info, Colors.red);
    } else if (actionType == actionTypeGuestUserButton) {
      context.push(PagePath.guestLoginPage);
    } else if (actionType == actionTypeBottomSignInButton) {
      context.pop();
    }
  }
}
