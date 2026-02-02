.PHONY: help get build clean test lint gen gen-watch gen-clean i18n run-dev run-staging run-prod build-apk-dev build-apk-prod build-ios-dev build-ios-prod watch fresh

# ============================================================================
# FLUTTER STARTER KIT - MAKEFILE
# ============================================================================

help:
	@echo ""
	@echo "╔══════════════════════════════════════════════════════════════════╗"
	@echo "║               WOEE Apps - Available Commands                     ║"
	@echo "╠══════════════════════════════════════════════════════════════════╣"
	@echo "║  SETUP                                                           ║"
	@echo "║    make get           Get dependencies                           ║"
	@echo "║    make gen           Run build_runner (freezed, json, etc)      ║"
	@echo "║    make gen-watch     Watch mode for build_runner                ║"
	@echo "║    make gen-clean     Clean generated files                      ║"
	@echo "║    make i18n          Merge i18n translations                    ║"
	@echo "║    make build         Run gen + i18n                             ║"
	@echo "║    make fresh         Clean + get + gen + i18n (full rebuild)    ║"
	@echo "║                                                                  ║"
	@echo "║  DEVELOPMENT                                                     ║"
	@echo "║    make run-dev       Run app (dev environment)                  ║"
	@echo "║    make run-staging   Run app (staging environment)              ║"
	@echo "║    make run-prod      Run app (prod environment)                 ║"
	@echo "║                                                                  ║"
	@echo "║  BUILD                                                           ║"
	@echo "║    make build-apk-dev   Build APK (dev)                          ║"
	@echo "║    make build-apk-prod  Build APK (prod)                         ║"
	@echo "║    make build-ios-dev   Build iOS (dev)                          ║"
	@echo "║    make build-ios-prod  Build iOS (prod)                         ║"
	@echo "║                                                                  ║"
	@echo "║  QUALITY                                                         ║"
	@echo "║    make test          Run tests                                  ║"
	@echo "║    make lint          Run analyzer                               ║"
	@echo "║    make clean         Clean project                              ║"
	@echo "╚══════════════════════════════════════════════════════════════════╝"
	@echo ""

# ============================================================================
# SETUP COMMANDS
# ============================================================================

get:
	@echo "📦 Getting dependencies..."
	flutter pub get

gen:
	@echo "⚙️  Running build_runner (freezed, json_serializable, injectable)..."
	dart run build_runner build --delete-conflicting-outputs
	@echo "✅ Code generation complete!"

gen-watch:
	@echo "👀 Watching for changes (auto-regenerate)..."
	dart run build_runner watch --delete-conflicting-outputs

gen-clean:
	@echo "🧹 Cleaning generated files..."
	dart run build_runner clean
	@echo "✅ Generated files cleaned!"

watch: gen-watch

i18n:
	@echo "🌐 Merging i18n translations..."
	dart run tool/i18n_bundle.dart

build: gen i18n
	@echo "✅ Build complete!"

fresh: clean get gen i18n
	@echo "✅ Fresh build complete!"

# ============================================================================
# DEVELOPMENT COMMANDS
# ============================================================================

run-dev:
	@echo "🚀 Running app (dev)..."
	flutter run --dart-define-from-file=.env/dev.json

run-staging:
	@echo "🚀 Running app (staging)..."
	flutter run --dart-define-from-file=.env/staging.json

run-prod:
	@echo "🚀 Running app (prod)..."
	flutter run --dart-define-from-file=.env/prod.json

# ============================================================================
# BUILD COMMANDS
# ============================================================================

build-apk-dev:
	@echo "📱 Building APK (dev)..."
	flutter build apk --dart-define-from-file=.env/dev.json

build-apk-prod:
	@echo "📱 Building APK (prod)..."
	flutter build apk --release --dart-define-from-file=.env/prod.json

build-ios-dev:
	@echo "🍎 Building iOS (dev)..."
	flutter build ios --dart-define-from-file=.env/dev.json --no-codesign

build-ios-prod:
	@echo "🍎 Building iOS (prod)..."
	flutter build ios --release --dart-define-from-file=.env/prod.json

build-appbundle-prod:
	@echo "📦 Building App Bundle (prod)..."
	flutter build appbundle --release --dart-define-from-file=.env/prod.json

# ============================================================================
# QUALITY COMMANDS
# ============================================================================

test:
	@echo "🧪 Running tests..."
	flutter test

test-coverage:
	@echo "📊 Running tests with coverage..."
	flutter test --coverage

lint:
	@echo "🔍 Running analyzer..."
	flutter analyze

format:
	@echo "✨ Formatting code..."
	dart format lib test

format-check:
	@echo "🔍 Checking format..."
	dart format --set-exit-if-changed lib test

# ============================================================================
# CLEAN COMMANDS
# ============================================================================

clean:
	@echo "🧹 Cleaning project..."
	flutter clean
	rm -rf .dart_tool
	rm -rf build
	dart run build_runner clean
	@echo "✅ Clean complete!"

clean-ios:
	@echo "🧹 Cleaning iOS..."
	cd ios && rm -rf Pods Podfile.lock && pod install

clean-full: clean
	@echo "🧹 Full clean (including pub cache)..."
	rm -rf pubspec.lock
	flutter pub get

# ============================================================================
# UTILITY COMMANDS
# ============================================================================

outdated:
	@echo "📋 Checking outdated packages..."
	flutter pub outdated

upgrade:
	@echo "⬆️  Upgrading packages..."
	flutter pub upgrade

doctor:
	@echo "🏥 Running Flutter doctor..."
	flutter doctor -v
