// Tool script - print is required for CLI output
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

/// Supported locales
const supportedLocales = ['en', 'id'];

/// Source pattern: features/*/l10n/[locale]/*.json
const featuresDir = 'lib/features';

/// Output directory
const outputDir = 'assets/i18n';

void main() async {
  print('');
  print('═══════════════════════════════════════════════════════════════');
  print('  i18n Bundle Generator');
  print('═══════════════════════════════════════════════════════════════');
  print('');

  final featuresDirectory = Directory(featuresDir);
  if (!featuresDirectory.existsSync()) {
    print('ERROR: Features directory not found: $featuresDir');
    exit(1);
  }

  // Ensure output directory exists
  final outputDirectory = Directory(outputDir);
  if (!outputDirectory.existsSync()) {
    outputDirectory.createSync(recursive: true);
    print('Created output directory: $outputDir');
  }

  var hasError = false;
  final stats = <String, _LocaleStats>{};

  for (final locale in supportedLocales) {
    print('Processing locale: $locale');
    print('─────────────────────────────────────────────────────────────────');

    final mergedTranslations = <String, dynamic>{};
    final duplicateKeys = <String, List<String>>{};
    var featureCount = 0;
    var fileCount = 0;

    // First, scan app-level l10n (shell/common)
    final appL10nDir = Directory('lib/app/l10n/$locale');
    if (appL10nDir.existsSync()) {
      final appJsonFiles =
          appL10nDir
              .listSync()
              .whereType<File>()
              .where((f) => f.path.endsWith('.json'))
              .toList()
            ..sort((a, b) => a.path.compareTo(b.path));

      for (final jsonFile in appJsonFiles) {
        fileCount++;
        final fileName = jsonFile.path.split(Platform.pathSeparator).last;
        final relativePath = 'app/l10n/$locale/$fileName';

        try {
          final content = jsonFile.readAsStringSync();
          final translations = jsonDecode(content) as Map<String, dynamic>;

          for (final entry in translations.entries) {
            final key = entry.key;
            final value = entry.value;

            if (!key.contains('.')) {
              print('  WARNING: Key "$key" in $relativePath has no namespace');
            }

            if (mergedTranslations.containsKey(key)) {
              duplicateKeys.putIfAbsent(key, () => []);
              duplicateKeys[key]!.add(relativePath);
              hasError = true;
            } else {
              mergedTranslations[key] = value;
            }
          }

          print('  $relativePath (${translations.length} keys)');
        } on FormatException catch (e) {
          print('  ERROR: Invalid JSON in $relativePath');
          print('         $e');
          hasError = true;
        } on Exception catch (e) {
          print('  ERROR: Failed to parse $relativePath');
          print('         $e');
          hasError = true;
        }
      }
    }

    // Scan all features
    final features =
        featuresDirectory.listSync().whereType<Directory>().toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    for (final featureDir in features) {
      final featureName = featureDir.path.split(Platform.pathSeparator).last;
      final l10nDir = Directory('${featureDir.path}/l10n/$locale');

      if (!l10nDir.existsSync()) {
        continue;
      }

      featureCount++;
      final jsonFiles =
          l10nDir
              .listSync()
              .whereType<File>()
              .where((f) => f.path.endsWith('.json'))
              .toList()
            ..sort((a, b) => a.path.compareTo(b.path));

      for (final jsonFile in jsonFiles) {
        fileCount++;
        final fileName = jsonFile.path.split(Platform.pathSeparator).last;
        final relativePath = 'features/$featureName/l10n/$locale/$fileName';

        try {
          final content = jsonFile.readAsStringSync();
          final translations = jsonDecode(content) as Map<String, dynamic>;

          // Validate and merge
          for (final entry in translations.entries) {
            final key = entry.key;
            final value = entry.value;

            // Validate key format (should have namespace)
            if (!key.contains('.')) {
              print('  WARNING: Key "$key" in $relativePath has no namespace');
            }

            // Check for duplicates
            if (mergedTranslations.containsKey(key)) {
              duplicateKeys.putIfAbsent(key, () => []);
              duplicateKeys[key]!.add(relativePath);
              hasError = true;
            } else {
              mergedTranslations[key] = value;
            }
          }

          print('  $relativePath (${translations.length} keys)');
        } on FormatException catch (e) {
          print('  ERROR: Invalid JSON in $relativePath');
          print('         $e');
          hasError = true;
        } on Exception catch (e) {
          print('  ERROR: Failed to parse $relativePath');
          print('         $e');
          hasError = true;
        }
      }
    }

    // Report duplicates
    if (duplicateKeys.isNotEmpty) {
      print('');
      print('  DUPLICATE KEYS FOUND:');
      for (final entry in duplicateKeys.entries) {
        print('    - ${entry.key}');
        for (final file in entry.value) {
          print('      in: $file');
        }
      }
    }

    // Sort keys alphabetically
    final sortedKeys = mergedTranslations.keys.toList()..sort();
    final sortedTranslations = <String, dynamic>{};
    for (final key in sortedKeys) {
      sortedTranslations[key] = mergedTranslations[key];
    }

    // Write output
    final outputFile = File('$outputDir/$locale.json');
    final encoder = JsonEncoder.withIndent('  ');
    outputFile.writeAsStringSync(encoder.convert(sortedTranslations));

    stats[locale] = _LocaleStats(
      featureCount: featureCount,
      fileCount: fileCount,
      keyCount: sortedTranslations.length,
    );

    print('');
    print('  Output: $outputDir/$locale.json');
    print(
      '  Features: $featureCount | Files: $fileCount | Keys: ${sortedTranslations.length}',
    );
    print('');
  }

  // Summary
  print('═══════════════════════════════════════════════════════════════');
  print('  SUMMARY');
  print('═══════════════════════════════════════════════════════════════');
  for (final entry in stats.entries) {
    final locale = entry.key;
    final stat = entry.value;
    print(
      '  $locale: ${stat.keyCount} keys from ${stat.featureCount} features',
    );
  }
  print('');

  if (hasError) {
    print('BUILD FAILED - Please fix errors above');
    exit(1);
  } else {
    print('BUILD SUCCESS');
    exit(0);
  }
}

class _LocaleStats {
  _LocaleStats({
    required this.featureCount,
    required this.fileCount,
    required this.keyCount,
  });

  final int featureCount;
  final int fileCount;
  final int keyCount;
}
