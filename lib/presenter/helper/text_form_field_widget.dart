import 'package:Akash/presenter/helper/worker_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/constants.dart';
import '../../core/helper/validator/input_validation_mixin.dart';
import '../logic/common/text_toggle_cubit.dart';


class TextFormFieldWidget with InputValidationMixin {

  Widget passwordTextFormField(
      BuildContext context,
      String hint,
      TextEditingController controller,
      String errorMessage,
      TextInputType inputType) {
    return BlocBuilder<TextToggleCubit, bool>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: GestureDetector(
              onTap: () {
                BlocProvider.of<TextToggleCubit>(context).showHideText();
              },
              child: Icon(
                state ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          //maxLength: 6,
          obscureText: !state,
          validator: (pin) {
            if (isTextValid(pin)) {
              return null;
            } else {
              return errorMessage;
            }
          },
        );
      },
    );
  }

  Widget textFormField(
      BuildContext context,
      String hint,
      TextEditingController controller,
      IconData? icon,
      String errorMessage,
      TextInputType inputType,
      WorkerDelegate callback) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: GestureDetector(
          onTap: () {
            callback(context, actionTypeTextFormField);
          },
          child: icon == null
              ? const Icon(null)
              : const Icon(
                  Icons.info,
                ),
        ),
      ),
      validator: (subId) {
        if (isTextValid(subId!)) {
          return null;
        } else {
          return errorMessage;
        }
      },
    );
  }
}
