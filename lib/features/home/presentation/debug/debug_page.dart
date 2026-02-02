import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/di/di.dart';
import 'package:testcase_1/app/router/auth_notifier.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/shared/widgets/widgets.dart';
import 'package:testcase_1/core/storage/token_store.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v1/example_bottom_sheet.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v1/example_draggable_sheet.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v1/example_fullscreen_modal.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v1/example_modal.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/index.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  static const routeName = '/debug';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug & Components'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: AppSpacing.paddingMd,
        children: [
          _buildSection(
            context,
            title: 'Modal System v2 (Simplified)',
            icon: Icons.auto_awesome,
            color: Colors.purple,
            children: [
              _DebugTile(
                icon: Icons.web_asset,
                title: 'Confirm Modal',
                subtitle: 'Simple confirmation dialog',
                color: Colors.purple,
                onTap: () => _testConfirmModal(context),
              ),
              _DebugTile(
                icon: Icons.view_agenda,
                title: 'Media Picker Sheet',
                subtitle: 'Bottom sheet with options',
                color: Colors.teal,
                onTap: () => _testMediaPickerSheet(context),
              ),
              _DebugTile(
                icon: Icons.expand,
                title: 'Item List Sheet',
                subtitle: 'Draggable expandable sheet',
                color: Colors.deepOrange,
                onTap: () => _testItemListSheet(context),
              ),
              _DebugTile(
                icon: Icons.fullscreen,
                title: 'Create Post Modal',
                subtitle: 'Fullscreen modal with form',
                color: Colors.indigo,
                onTap: () => _testCreatePostModal(context),
              ),
            ],
          ),
          AppSpacing.heightLg,
          _buildSection(
            context,
            title: 'Modal System v1 (Original)',
            icon: Icons.widgets,
            color: Colors.blue,
            children: [
              _DebugTile(
                icon: Icons.web_asset,
                title: 'Example Modal',
                subtitle: 'Original center dialog',
                color: Colors.purple,
                onTap: () => _testExampleModal(context),
              ),
              _DebugTile(
                icon: Icons.view_agenda,
                title: 'Example Bottom Sheet',
                subtitle: 'Original bottom sheet',
                color: Colors.teal,
                onTap: () => _testExampleBottomSheet(context),
              ),
              _DebugTile(
                icon: Icons.expand,
                title: 'Example Draggable Sheet',
                subtitle: 'Original draggable sheet',
                color: Colors.deepOrange,
                onTap: () => _testExampleDraggableSheet(context),
              ),
              _DebugTile(
                icon: Icons.fullscreen,
                title: 'Example Fullscreen Modal',
                subtitle: 'Original fullscreen modal',
                color: Colors.indigo,
                onTap: () => _testExampleFullscreenModal(context),
              ),
            ],
          ),
          AppSpacing.heightLg,
          _buildSection(
            context,
            title: 'Auth Debug',
            icon: Icons.security,
            color: Colors.red,
            children: [
              _DebugTile(
                icon: Icons.delete_forever,
                title: 'Clear All Tokens',
                subtitle: 'Simulate session expired',
                color: Colors.red,
                onTap: () => _clearAllTokens(context),
              ),
              _DebugTile(
                icon: Icons.edit,
                title: 'Invalidate Access Token',
                subtitle: 'Keep refresh token, clear access',
                color: Colors.orange,
                onTap: () => _invalidateAccessToken(context),
              ),
              _DebugTile(
                icon: Icons.logout,
                title: 'Manual Logout',
                subtitle: 'Logout without session expired',
                color: Colors.blue,
                onTap: () => _manualLogout(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            AppSpacing.widthSm,
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        AppSpacing.heightSm,
        Card(
          margin: EdgeInsets.zero,
          child: Column(children: children),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Modal v2 Tests
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> _testConfirmModal(BuildContext context) async {
    final result = await ConfirmModal.show(
      context,
      title: 'Delete Item',
      message:
          'Are you sure you want to delete this item? This action cannot be undone.',
      confirmText: 'Delete',
      isDestructive: true,
    );
    _showResult(context, 'Confirm Modal', result);
  }

  Future<void> _testMediaPickerSheet(BuildContext context) async {
    final result = await MediaPickerSheet.show(context);
    _showResult(context, 'Media Picker', result);
  }

  Future<void> _testItemListSheet(BuildContext context) async {
    final result = await ItemListSheet.show(context);
    _showResult(context, 'Item List', result);
  }

  Future<void> _testCreatePostModal(BuildContext context) async {
    final result = await CreatePostModal.show(context);
    _showResult(context, 'Create Post', result);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Modal v1 Tests
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> _testExampleModal(BuildContext context) async {
    final result = await ExampleModal.show(context);
    _showResult(context, 'Example Modal', result);
  }

  Future<void> _testExampleBottomSheet(BuildContext context) async {
    final result = await ExampleBottomSheet.show(context);
    _showResult(context, 'Example Bottom Sheet', result);
  }

  Future<void> _testExampleDraggableSheet(BuildContext context) async {
    final result = await ExampleDraggableSheet.show(context);
    _showResult(context, 'Example Draggable', result);
  }

  Future<void> _testExampleFullscreenModal(BuildContext context) async {
    final result = await ExampleFullscreenModal.show(context);
    _showResult(context, 'Example Fullscreen', result);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Auth Debug
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> _clearAllTokens(BuildContext context) async {
    await getIt<TokenStore>().clearTokens();
    getIt<AuthNotifier>().logout(reason: SessionExpireReason.refreshFailed);
  }

  Future<void> _invalidateAccessToken(BuildContext context) async {
    await getIt<TokenStore>().saveAccessToken('invalid_token');
    _showResult(context, 'Access Token', 'Invalidated. Try an API call.');
  }

  Future<void> _manualLogout(BuildContext context) async {
    await getIt<TokenStore>().clearTokens();
    getIt<AuthNotifier>().logout(reason: SessionExpireReason.manual);
  }

  void _showResult(BuildContext context, String title, dynamic result) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$title result: $result')));
  }
}

class _DebugTile extends StatelessWidget {
  const _DebugTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: AppText(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: context.colors.textSecondary, fontSize: 12),
      ),
      trailing: Icon(Icons.chevron_right, color: context.colors.textSecondary),
      onTap: onTap,
    );
  }
}
