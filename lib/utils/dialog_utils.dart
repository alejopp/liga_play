import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> showCustomDialog(
    BuildContext context, {
    String? title,
    String? description,
    String? confirmButtonText,
    String? cancelButtonText,
    Function()? onConfirmButtonPressed,
    Function()? onCancelButtonPressed,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(description ?? ""),
          actions: [
            TextButton(
              onPressed: () {
                onCancelButtonPressed?.call();
              },
              child: Text(cancelButtonText ?? "Cancelar"),
            ),
            TextButton(
              onPressed: () {
                onConfirmButtonPressed?.call();
              },
              child: Text(confirmButtonText ?? "Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
