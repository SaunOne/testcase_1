# Tally In - Flutter Application

Production-ready Flutter application for warehouse tally management with clean architecture and BLoC state management.

## 📋 Table of Contents

- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [State Management](#state-management)
- [Libraries & Dependencies](#libraries--dependencies)
- [Development Workflow](#development-workflow)
- [Testing](#testing)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: `^3.10.7`
- Dart SDK: `^3.10.7`
- Make (for running Makefile commands)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd testcase_1
   ```

2. **Install dependencies**
   ```bash
   make get
   # or
   flutter pub get
   ```

3. **Generate code** (freezed, json_serializable, injectable)
   ```bash
   make gen
   # or
   dart run build_runner build --delete-conflicting-outputs
   ```

### Running the App

**Development mode:**
```bash
make run-dev
# or
flutter run --dart-define-from-file=.env/dev.json
```

**Other environments:**
```bash
make run-staging  # Staging environment
make run-prod     # Production environment
```

### Available Make Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make get` | Install dependencies |
| `make gen` | Run code generation (freezed, json_serializable, injectable) |
| `make gen-watch` | Watch mode for auto code generation |
| `make gen-clean` | Clean generated files |
| `make build` | Run gen + i18n |
| `make fresh` | Full rebuild (clean + get + gen + i18n) |
| `make run-dev` | Run app in development mode |
| `make test` | Run unit tests |
| `make lint` | Run Flutter analyzer |
| `make clean` | Clean project |

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a **feature-first** approach and **BLoC** state management.

### Core Principles

1. **Separation of Concerns** - Each layer has a single responsibility
2. **Dependency Rule** - Dependencies point inward (presentation → domain → data)
3. **Feature Isolation** - Features are self-contained modules
4. **Testability** - All layers are testable in isolation

### Layer Structure

```
lib/
├── app/                    # Application layer (DI, routing, bootstrap)
├── core/                   # Shared infrastructure
│   ├── network/           # Dio client, interceptors
│   ├── shared/            # Shared widgets, styles, utilities
│   └── utils/             # Extensions, helpers
└── features/              # Feature modules (vertical slices)
    └── [feature]/
        ├── data/          # Data layer
        │   ├── api/       # API endpoints
        │   ├── dto/       # Data Transfer Objects
        │   └── models/    # Domain models
        ├── presentations/ # Presentation layer
        │   └── [screen]/
        │       ├── page/              # Page level
        │       ├── page/sections/     # Section level
        │       ├── _widgets/          # Widget level
        │       ├── bloc/              # BLoC/Cubit
        │       └── routes/            # Feature routing
        └── l10n/          # Feature localization
```

---

## 📱 Presentation Layer Architecture

The presentation layer is organized into **three distinct levels** for better maintainability and reusability.

### 1. Page Level

**Location:** `features/[feature]/presentations/[screen]/page/`

**Responsibility:**
- Top-level screen widget
- Provides BLoC to the widget tree
- Composes sections into a layout
- Handles page-level navigation

**Example:**
```dart
class TallyInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TallyMonitorBloc()),
        BlocProvider(create: (_) => TallyListBloc()),
        BlocProvider(create: (_) => TallyInputBloc()),
      ],
      child: TallyInLayout(
        topBar: TallyTopBarSection(data: topBarData),
        palletMonitor: const PalletMonitorSection(),
        itemList: const ListItemSection(),
        inputPanel: const InputPanelSection(),
      ),
    );
  }
}
```

### 2. Section Level

**Location:** `features/[feature]/presentations/[screen]/page/sections/`

**Responsibility:**
- Self-contained UI sections
- **Handles BLoC internally** (no Connected wrapper pattern)
- Reads state directly from BLoC
- Dispatches events to BLoC
- Composes widgets into meaningful sections

**Key Pattern:**
- **NO** separate "Connected" wrapper classes
- BLoC logic is **inside** the section widget
- Minimal props (only essential data)

**Example:**
```dart
class InputPanelSection extends StatelessWidget {
  const InputPanelSection({this.useFixedHeight = false, super.key});

  final bool useFixedHeight;

  @override
  Widget build(BuildContext context) {
    // BLoC logic INSIDE section
    return BlocBuilder<TallyInputBloc, TallyInputState>(
      builder: (context, state) {
        return AppCard(
          child: Column(
            children: [
              TallyInputHeader(),
              TallyInputFormFields(
                condition: state.condition,
                onConditionSelected: (value) {
                  context.read<TallyInputBloc>().add(
                    TallyInputEvent.setCondition(value),
                  );
                },
              ),
              TallyWeightRow(weight: state.inputWeight),
              TallyNumpad(
                onNumpadTap: (key) {
                  context.read<TallyInputBloc>().add(
                    TallyInputEvent.numpadPressed(key),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
```

### 3. Widget Level

**Location:** `features/[feature]/presentations/[screen]/_widgets/`

**Responsibility:**
- Reusable UI components
- Pure presentation (no BLoC logic)
- Receive data via props
- Emit events via callbacks

**Widget Sharing Rules:**

| Location | Usage | Example |
|----------|-------|---------|
| `features/[feature]/presentations/[screen]/_widgets/` | Shared across sections in same screen | `TallyInputHeader`, `TallyNumpad` |
| `core/shared/widgets/` | Global, cross-feature widgets | `AppButton`, `AppTextField` |

**Example:**
```dart
class TallyNumpad extends StatelessWidget {
  const TallyNumpad({
    this.onNumpadTap,
    this.onAddItem,
    this.isDisabled = false,
    super.key,
  });

  final void Function(String value)? onNumpadTap;
  final VoidCallback? onAddItem;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    // Pure UI - no BLoC logic
    return Column(
      children: [
        // Numpad grid...
      ],
    );
  }
}
```

---

## 🔄 State Management - BLoC Pattern

### Why BLoC?

1. **Predictable State** - Single source of truth
2. **Separation of Logic** - Business logic separate from UI
3. **Testability** - Easy to test state transitions
4. **Reactive** - Stream-based architecture

### BLoC Structure

```
bloc/
└── [feature]_bloc/
    ├── [feature]_bloc.dart       # Business logic
    ├── [feature]_event.dart      # Events (user actions)
    └── [feature]_state.dart      # States (UI states)
```

### Event-State Flow

```
User Action → Event → BLoC → State → UI Update
```

**Example:**
```dart
// 1. User taps numpad
onNumpadTap: (key) {
  // 2. Dispatch event
  context.read<TallyInputBloc>().add(
    TallyInputEvent.numpadPressed(key),
  );
}

// 3. BLoC handles event
on<_NumpadPressed>((event, emit) {
  final newWeight = state.inputWeight + event.key;
  emit(state.copyWith(inputWeight: newWeight));
});

// 4. UI rebuilds with new state
BlocBuilder<TallyInputBloc, TallyInputState>(
  builder: (context, state) {
    return Text(state.inputWeight); // Updates automatically
  },
)
```

### State Management Best Practices

1. **Use `BlocBuilder` for UI updates** - Rebuilds only when state changes
2. **Use `BlocSelector` for granular rebuilds** - Rebuilds only when specific field changes
3. **Use `BlocListener` for side effects** - Navigation, snackbars, dialogs
4. **Keep BLoC logic in sections** - No separate Connected wrapper classes

---

## 📚 Libraries & Dependencies

### Core Dependencies

| Library | Purpose | Why? |
|---------|---------|------|
| `flutter_bloc` | State management | Predictable, testable state management with streams |
| `freezed` | Immutable models | Type-safe unions, copyWith, pattern matching |
| `injectable` + `get_it` | Dependency injection | Compile-time DI with code generation |
| `go_router` | Navigation | Declarative routing with deep linking support |
| `dio` | HTTP client | Powerful HTTP client with interceptors |
| `easy_localization` | i18n | Simple localization with JSON files |

### UI & Utilities

| Library | Purpose |
|---------|---------|
| `google_fonts` | Typography |
| `flutter_svg` | SVG support |
| `cached_network_image` | Image caching |
| `intl` | Date/number formatting |
| `logger` | Logging |

### Feature-Specific

| Library | Purpose | Used In |
|---------|---------|---------|
| `flutter_map` + `latlong2` | Maps | Tally In (location tracking) |
| `geolocator` | GPS location | Tally In |
| `permission_handler` | Runtime permissions | Location access |
| `google_sign_in` + `sign_in_with_apple` | Social auth | Authentication |

### Development Tools

| Library | Purpose |
|---------|---------|
| `build_runner` | Code generation runner |
| `freezed` + `json_serializable` | Model generation |
| `injectable_generator` | DI code generation |
| `very_good_analysis` | Strict linting rules |

### Testing

| Library | Purpose |
|---------|---------|
| `flutter_test` | Unit & widget tests |
| `bloc_test` | BLoC testing utilities |
| `mocktail` | Mocking framework |

---

## 🛠️ Development Workflow

### 1. Code Generation

When you modify:
- `@freezed` classes
- `@JsonSerializable` classes
- `@injectable` / `@lazySingleton` classes

Run:
```bash
make gen
```

For auto-regeneration during development:
```bash
make gen-watch
```

### 2. Adding a New Feature

```bash
lib/features/
└── new_feature/
    ├── data/
    │   ├── api/
    │   │   └── new_feature_endpoints.dart
    │   ├── dto/
    │   │   ├── request.dart
    │   │   └── response.dart
    │   └── models/
    │       └── new_feature_model.dart
    ├── presentations/
    │   └── new_feature_screen/
    │       ├── page/
    │       │   ├── new_feature_page.dart
    │       │   └── sections/
    │       │       └── main_section.dart
    │       ├── _widgets/
    │       │   └── custom_widget.dart
    │       ├── bloc/
    │       │   └── new_feature_bloc/
    │       │       ├── new_feature_bloc.dart
    │       │       ├── new_feature_event.dart
    │       │       └── new_feature_state.dart
    │       └── routes/
    │           └── new_feature_routes.dart
    └── l10n/
        └── en.json
```

### 3. Styling Guidelines

Use design tokens from `core/shared/styles/tokens/`:

```dart
// ✅ CORRECT
Container(
  color: AppColors.primary,
  padding: EdgeInsets.all(AppSpacing.md),
  borderRadius: BorderRadius.circular(AppRadius.md),
)

// ❌ WRONG
Container(
  color: Colors.blue,
  padding: EdgeInsets.all(16),
  borderRadius: BorderRadius.circular(8),
)
```

---

## 🧪 Testing

### Running Tests

```bash
# Run all tests
make test

# Run with coverage
make test-coverage

# Run specific test file
flutter test test/features/tally_in/bloc/tally_input_bloc_test.dart
```

### Test Structure

```
test/
├── features/
│   └── [feature]/
│       ├── bloc/              # BLoC tests
│       ├── data/              # Repository/API tests
│       └── presentations/     # Widget tests
└── helpers/
    └── test_helpers.dart      # Test utilities
```

### Testing Best Practices

1. **Unit Tests** - Test BLoC logic, models, utilities
2. **Widget Tests** - Test UI components in isolation
3. **Integration Tests** - Test feature flows end-to-end
4. **Use `bloc_test`** - For testing BLoC state transitions
5. **Use `mocktail`** - For mocking dependencies

---

## 📝 Code Quality

### Linting

```bash
make lint
```

This project uses `very_good_analysis` for strict linting rules.

### Formatting

```bash
make format        # Format code
make format-check  # Check formatting
```

---

## 🔧 Troubleshooting

### Common Issues

**1. Code generation not working**
```bash
make gen-clean
make fresh
```

**2. iOS build issues**
```bash
make clean-ios
```

**3. Dependency conflicts**
```bash
make clean-full
```

---

## 📖 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Injectable Package](https://pub.dev/packages/injectable)
- [Go Router](https://pub.dev/packages/go_router)

---

## 👥 Contributing

1. Follow the architecture guidelines
2. Write tests for new features
3. Run `make lint` before committing
4. Use conventional commits

---

## 📄 License

[Your License Here]
