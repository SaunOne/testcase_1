// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

void main() async {
  final baseDir = Directory('assets/i18n');
  final featuresDir = Directory('lib/features');

  if (!await baseDir.exists()) {
    print('Error: assets/i18n directory not found');
    exit(1);
  }

  // Get all base language files
  final baseFiles = await baseDir
      .list()
      .where((f) => f.path.endsWith('.json'))
      .cast<File>()
      .toList();

  for (final baseFile in baseFiles) {
    final locale = baseFile.path.split('/').last.replaceAll('.json', '');
    final merged = <String, dynamic>{};

    // Load base translations
    final baseContent = await baseFile.readAsString();
    final baseJson = jsonDecode(baseContent) as Map<String, dynamic>;
    merged.addAll(_flattenMap(baseJson));

    // Find feature translations
    if (await featuresDir.exists()) {
      await for (final feature in featuresDir.list()) {
        if (feature is Directory) {
          final featureL10nDir = Directory('${feature.path}/l10n/$locale');
          if (await featureL10nDir.exists()) {
            await for (final file in featureL10nDir.list()) {
              if (file is File && file.path.endsWith('.json')) {
                final featureContent = await file.readAsString();
                final featureJson =
                    jsonDecode(featureContent) as Map<String, dynamic>;
                merged.addAll(_flattenMap(featureJson));
                print('Merged: ${file.path}');
              }
            }
          }
        }
      }
    }

    // Write merged file
    final outputFile = File('assets/i18n/$locale.json');
    final encoder = const JsonEncoder.withIndent('  ');
    await outputFile.writeAsString(encoder.convert(_unflattenMap(merged)));
    print('Output: ${outputFile.path}');
  }

  print('i18n merge complete!');
}

Map<String, dynamic> _flattenMap(
  Map<String, dynamic> map, [
  String prefix = '',
]) {
  final result = <String, dynamic>{};

  for (final entry in map.entries) {
    final key = prefix.isEmpty ? entry.key : '$prefix.${entry.key}';

    if (entry.value is Map<String, dynamic>) {
      result.addAll(_flattenMap(entry.value as Map<String, dynamic>, key));
    } else {
      result[key] = entry.value;
    }
  }

  return result;
}

Map<String, dynamic> _unflattenMap(Map<String, dynamic> map) {
  final result = <String, dynamic>{};

  for (final entry in map.entries) {
    final keys = entry.key.split('.');
    var current = result;

    for (var i = 0; i < keys.length - 1; i++) {
      current.putIfAbsent(keys[i], () => <String, dynamic>{});
      current = current[keys[i]] as Map<String, dynamic>;
    }

    current[keys.last] = entry.value;
  }

  return result;
}
