import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({required BuildContext context, required String loadingText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.primaryLight),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(loadingText, style: AppStyles.medium16Primary),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String contentMsg,
    String? title,
    String? posActionName,
    String? negActionName,
    Function? posActionFunction,
    Function? negActionFunction,
    bool barrierDismissible = true,
    TextStyle? contentStyle,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionFunction?.call();
          },
          child: Text(posActionName, style: contentStyle ?? AppStyles.medium16Primary),
        ),
      );
    }

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionFunction?.call();
          },
          child: Text(negActionName, style: contentStyle ?? AppStyles.medium16Primary),
        ),
      );
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(contentMsg, style: contentStyle ?? AppStyles.medium16Primary),
          title: Text(title ?? '', style: contentStyle ?? AppStyles.medium16Primary),
          actions: actions,
        );
      },
    );
  }
}
