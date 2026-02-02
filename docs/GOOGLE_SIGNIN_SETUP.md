# Google Sign-In Setup Guide

## Error yang Terjadi

```
PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 10, null, null)
```

**ApiException: 10** = Developer console configuration issue

---

## ✅ Solusi Lengkap

### 1. SHA-1 Fingerprint (Debug)

SHA-1 fingerprint Anda untuk debug build:

```
05:0E:7E:30:94:D8:28:F8:EF:F5:0C:90:C7:CD:B6:D7:0C:51:DC:CB
```

Untuk mendapatkan SHA-1 release key (nanti saat production):

```bash
keytool -list -v -keystore /path/to/your/release.keystore -alias your-alias
```

---

### 2. Konfigurasi Google Cloud Console

#### Step 1: Buat/Pilih Project

1. Buka https://console.cloud.google.com/
2. Klik dropdown project di header
3. Klik "New Project" atau pilih existing project
4. Nama project: **Woee** (atau nama lain)
5. Klik "Create"

#### Step 2: Enable Google Sign-In API

1. Navigation Menu (☰) → **APIs & Services** → **Library**
2. Cari: **"Google Sign-In API"** atau **"Google+ API"**
3. Klik API tersebut
4. Klik tombol **"Enable"**

#### Step 3: Konfigurasi OAuth Consent Screen

1. Navigation Menu → **APIs & Services** → **OAuth consent screen**
2. Pilih **"External"** (untuk testing dengan akun Google pribadi)
3. Klik **"Create"**
4. Isi form:
   - **App name**: `Woee`
   - **User support email**: email Anda
   - **App logo**: (optional)
   - **App domain**: (kosongkan untuk testing)
   - **Developer contact information**: email Anda
5. Klik **"Save and Continue"**
6. **Scopes**: Skip (klik "Save and Continue")
7. **Test users**: Tambahkan email Google Anda untuk testing
8. Klik **"Save and Continue"**
9. Review dan klik **"Back to Dashboard"**

#### Step 4: Buat OAuth 2.0 Client ID untuk Android

1. Navigation Menu → **APIs & Services** → **Credentials**
2. Klik **"+ Create Credentials"** → **"OAuth client ID"**
3. Pilih Application type: **Android**
4. Isi form:
   - **Name**: `Woee Android App`
   - **Package name**: `com.woee` ✅
   - **SHA-1 certificate fingerprint**:
     ```
     05:0E:7E:30:94:D8:28:F8:EF:F5:0C:90:C7:CD:B6:D7:0C:51:DC:CB
     ```
5. Klik **"Create"**
6. Klik **"OK"** pada popup

#### Step 5: Buat OAuth 2.0 Client ID untuk Web (PENTING!)

1. Klik **"+ Create Credentials"** → **"OAuth client ID"** lagi
2. Pilih Application type: **Web application**
3. Isi form:
   - **Name**: `Woee Web Client`
   - **Authorized JavaScript origins**: (kosongkan)
   - **Authorized redirect URIs**: (kosongkan)
4. Klik **"Create"**
5. **SIMPAN Client ID** yang muncul! Format: `xxxxx.apps.googleusercontent.com`
6. Klik **"OK"**

---

### 3. Update Kode Flutter

Setelah mendapat **Web Client ID** dari step 5, update file:

**File**: `lib/features/auth/presentation/login/page/sections/login_social_section.dart`

Ganti baris 23-28 dengan:

```dart
final _googleSignIn = GoogleSignIn(
  scopes: ['email'],
  serverClientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com', // ⬅️ Paste Web Client ID di sini
);
```

**Contoh**:

```dart
final _googleSignIn = GoogleSignIn(
  scopes: ['email'],
  serverClientId: '123456789-abcdefghijk.apps.googleusercontent.com',
);
```

---

### 4. Verifikasi Package Name

Package name sudah benar: ✅ `com.woee`

File yang sudah diupdate:

- `android/app/build.gradle.kts` → `applicationId = "com.woee"`
- `android/app/build.gradle.kts` → `namespace = "com.woee"`

---

### 5. Testing

Setelah semua setup:

1. **Rebuild app**:

   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Test Google Sign-In**:
   - Tap tombol "Continue with Google"
   - Pilih akun Google Anda
   - Jika berhasil, akan redirect ke Home Page

---

## 🔍 Troubleshooting

### Error: ApiException: 10 (masih muncul)

- ✅ Pastikan SHA-1 sudah didaftarkan di Google Cloud Console
- ✅ Pastikan package name `com.woee` sama persis
- ✅ Tunggu 5-10 menit setelah setup (propagation time)
- ✅ Uninstall app dari device, lalu install ulang

### Error: ApiException: 12

- Artinya: Invalid client ID
- Solusi: Periksa `serverClientId` di kode, pastikan benar

### Error: ApiException: 7

- Artinya: Network error
- Solusi: Periksa koneksi internet

---

## 📦 Dependencies yang Dibutuhkan

Sudah ada di `pubspec.yaml`:

```yaml
dependencies:
  google_sign_in: ^6.2.2
  sign_in_with_apple: ^6.1.3 # untuk Apple Sign-In (iOS/macOS)
```

---

## 🎯 Checklist

- [ ] Buat project di Google Cloud Console
- [ ] Enable Google Sign-In API
- [ ] Setup OAuth Consent Screen
- [ ] Buat Android OAuth Client ID dengan SHA-1
- [ ] Buat Web OAuth Client ID
- [ ] Copy Web Client ID ke kode Flutter
- [ ] Rebuild & test app

---

## 📞 Support

Jika masih error setelah semua langkah:

1. Screenshot error message
2. Screenshot Google Cloud Console Credentials page
3. Verifikasi package name dan SHA-1 sudah benar
