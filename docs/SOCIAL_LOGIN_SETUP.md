# Social Login Setup Guide

This document explains how to configure Google and Apple Sign-In for the Woee app.

## Dependencies Added

```yaml
# pubspec.yaml
google_sign_in: ^6.2.1
sign_in_with_apple: ^6.1.1
```

## Run Build Runner

After implementation, generate the `.g.dart` files:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

---

## Android Setup

### 1. Google Services Configuration

Your `google-services.json` is already in place at:

```
android/app/google-services.json
```

### 2. Verify Android Configuration

Ensure `android/build.gradle` has:

```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

Ensure `android/app/build.gradle` has:

```gradle
apply plugin: 'com.google.gms.google-services'
```

### 3. SHA-1 Certificate Fingerprint

For Google Sign-In to work, you need to add your SHA-1 fingerprint to Firebase Console:

```bash
# Debug SHA-1
cd android && ./gradlew signingReport
```

Add the SHA-1 fingerprint to your Firebase project:

1. Go to Firebase Console → Project Settings → Your Android app
2. Add the SHA-1 fingerprint

### 4. API Base URL for Android Emulator

For Android emulator, use `10.0.2.2` instead of `localhost`:

```json
// .env/dev.json
{
  "ENV": "dev",
  "BASE_URL": "http://10.0.2.2:8081/api/v1",
  "API_KEY": "dev-api-key"
}
```

---

## iOS Setup

### 1. GoogleService-Info.plist

Download from Firebase Console and place at:

```
ios/Runner/GoogleService-Info.plist
```

### 2. URL Schemes for Google Sign-In

Add to `ios/Runner/Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Reversed client ID from GoogleService-Info.plist -->
            <string>com.googleusercontent.apps.YOUR_CLIENT_ID</string>
        </array>
    </dict>
</array>
```

### 3. Apple Sign-In Capability

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select the Runner target
3. Go to "Signing & Capabilities" tab
4. Click "+ Capability"
5. Add "Sign in with Apple"

### 4. Apple Sign-In Entitlements

Ensure `ios/Runner/Runner.entitlements` contains:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.developer.applesignin</key>
    <array>
        <string>Default</string>
    </array>
</dict>
</plist>
```

### 5. API Base URL for iOS Simulator

For iOS simulator, `localhost` works directly:

```json
// .env/dev.json (for iOS simulator)
{
  "ENV": "dev",
  "BASE_URL": "http://localhost:8081/api/v1",
  "API_KEY": "dev-api-key"
}
```

For physical iOS device, use your machine's local IP:

```json
{
  "ENV": "dev",
  "BASE_URL": "http://192.168.x.x:8081/api/v1",
  "API_KEY": "dev-api-key"
}
```

---

## Backend API Endpoints

| Endpoint             | Method | Body                            |
| -------------------- | ------ | ------------------------------- |
| `/health`            | GET    | -                               |
| `/auth/oauth/google` | POST   | `{ "id_token": "string" }`      |
| `/auth/oauth/apple`  | POST   | `{ "id_token": "string" }`      |
| `/auth/refresh`      | POST   | `{ "refresh_token": "string" }` |

### Response Format

```json
{
  "access_token": "string",
  "account_id": "uuid",
  "expires_in": 900,
  "refresh_token": "string"
}
```

---

## Folder Structure Created

```
lib/
├── core/
│   └── shared/
│       ├── styles/
│       │   ├── app_gradients.dart      # Gradient presets + helpers
│       │   └── app_blur.dart           # Blur/glass utilities
│       └── widgets/
│           └── backgrounds/
│               └── woee_line_silhouette_bg.dart
└── features/
    └── auth/
        ├── bloc/
        │   └── social_login/
        │       ├── social_login_bloc.dart
        │       ├── social_login_event.dart
        │       └── social_login_state.dart
        ├── data/
        │   ├── api/
        │   │   └── auth_api_service.dart
        │   ├── dto/
        │   │   ├── oauth_login_request.dart
        │   │   ├── oauth_login_response.dart
        │   │   ├── refresh_request.dart
        │   │   └── refresh_response.dart
        │   └── repository/
        │       └── auth_repository.dart
        └── presentation/
            └── login/
                ├── page/
                │   └── social_login_page.dart
                ├── sections/
                │   ├── login_header_section.dart
                │   ├── login_social_section.dart
                │   └── login_footer_section.dart
                └── widgets/
                    ├── auth_social_button.dart
                    └── login_layout.dart
```

---

## Usage

### Navigate to Social Login Page

```dart
import 'package:go_router/go_router.dart';
import 'package:testcase_1/features/auth/presentation/login/page/social_login_page.dart';

// Navigate to social login
context.go(SocialLoginPage.routeName);
```

### Set as Initial Route

To make social login the initial route, update `app_router.dart`:

```dart
static final GoRouter router = GoRouter(
  initialLocation: SocialLoginPage.routeName,  // Change from LoginPage.routeName
  // ...
);
```

---

## Troubleshooting

### Google Sign-In Issues

1. **"ApiException: 10"** - SHA-1 fingerprint not configured
2. **"ApiException: 12500"** - OAuth client ID mismatch
3. **Network errors** - Check BASE_URL configuration

### Apple Sign-In Issues

1. **"AuthorizationErrorCode.invalidResponse"** - Capability not added in Xcode
2. **Only works on iOS/macOS** - Apple Sign-In is platform-specific

### Build Runner Errors

```bash
# Clean and rebuild
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```
