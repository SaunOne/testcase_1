import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/sections/confirm_action_content.dart';

/// Simple confirmation dialog modal
///
/// Usage:
/// ```dart
/// final confirmed = await ConfirmModal.show(
///   context,
///   title: 'Delete Item',
///   message: 'Are you sure you want to delete this item?',
///   isDestructive: true,
/// );
/// if (confirmed == true) { ... }
/// ```
class ConfirmModal extends BaseModal<bool> {
  const ConfirmModal({
    required this.modalTitle,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.isDestructive = false,
    super.key,
  });

  final String modalTitle;
  final String message;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;

  @override
  String? get title => modalTitle;

  @override
  Widget buildContent(BuildContext context) {
    return ConfirmActionContent(
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      isDestructive: isDestructive,
      onConfirm: () => close(context, true),
      onCancel: () => close(context, false),
    );
  }

  /// Show confirmation modal
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDestructive = false,
  }) {
    return context.showModal<bool>(
      builder: (_) => ConfirmModal(
        modalTitle: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        isDestructive: isDestructive,
      ),
    );
  }
}
