import 'package:flutter/material.dart';
import 'app_snackbar.dart';

void showError(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 4),
  SnackBarAction? action,
}) {
  AppSnackbar.show(
    context,
    message: message,
    type: SnackbarType.error,
    duration: duration,
    action: action,
  );
}

void showSuccess(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
}) {
  AppSnackbar.show(
    context,
    message: message,
    type: SnackbarType.success,
    duration: duration,
    action: action,
  );
}

void showWarning(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
}) {
  AppSnackbar.show(
    context,
    message: message,
    type: SnackbarType.warning,
    duration: duration,
    action: action,
  );
}

void showInfo(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
}) {
  AppSnackbar.show(
    context,
    message: message,
    type: SnackbarType.info,
    duration: duration,
    action: action,
  );
}
