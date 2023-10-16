import 'package:Akash/presenter/helper/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helper/constants.dart';
import '../../../di/injection_container.dart';
import '../../helper/info_bottom_sheet.dart';
import '../../helper/text_form_field_widget.dart';
import '../../helper/worker_delegate.dart';

class ForgotPinPage extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController subIdController = TextEditingController();
  final TextEditingController rmnController = TextEditingController();

  ForgotPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonWidget buttonWidget = sl.get<ButtonWidget>();
    final TextFormFieldWidget textFormFieldWidget = sl.get<TextFormFieldWidget>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text("Back"),
      ),
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
                    const Text("Forgot your MyAKASH PIN ?"),
                    const SizedBox(height: 30),
                    const Text(forgotPinMessage1),
                    const Text(forgotPinMessage2),
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
                        context, "RESET PIN", Colors.blueAccent,
                        Colors.white, actionTypeMainBtn,
                        onClickEvent),
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
    }
  }
}
