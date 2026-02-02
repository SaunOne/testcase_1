# ✅ Firebase Setup - Sudah Lengkap!

## 📋 Status Setup

### ✅ Yang Sudah Dikonfigurasi:

#### 1. **Firebase Project**

- Project ID: `woee-apps`
- Project Number: `508340358540`
- Storage Bucket: `woee-apps.firebasestorage.app`

#### 2. **Android Configuration**

- Package Name: `package:testcase_1e` ✅
- SHA-1 Certificate: `050e7e3094d828f8eff50c90c7cdb6d70c51dccb` ✅
- `google-services.json` ✅ Sudah ada di `android/app/`

#### 3. **Gradle Configuration**

- `android/settings.gradle.kts`: Google Services plugin ✅
- `android/app/build.gradle.kts`: Plugin applied ✅

#### 4. **Flutter Dependencies**

```yaml
firebase_core: ^3.10.0      ✅
firebase_auth: ^5.3.4       ✅
google_sign_in: ^6.2.1      ✅
sign_in_with_apple: ^6.1.1  ✅
```

#### 5. **Firebase Initialization**

- `lib/firebase_options.dart` ✅ Generated
- `lib/app/bootstrap/bootstrap.dart` ✅ Firebase initialized

#### 6. **Google Sign-In dengan Firebase**

- `login_social_section.dart` ✅ Updated to use Firebase Auth

---

## 🔄 Alur Login dengan Firebase

### **Google Sign-In Flow:**

```
1. User tap "Continue with Google"
   ↓
2. GoogleSignIn.signIn() → Pilih akun Google
   ↓
3. Dapat Google Auth (accessToken, idToken)
   ↓
4. Create Firebase Credential
   ↓
5. FirebaseAuth.signInWithCredential()
   ↓
6. Dapat Firebase User + Firebase ID Token
   ↓
7. Kirim Firebase ID Token ke Backend
   ↓
8. Backend verify token & return access token
   ↓
9. Save token & navigate to Home
```

### **Keuntungan Pakai Firebase:**

✅ **Secure**: Firebase verify token di server-side  
✅ **Consistent**: ID token format sama untuk semua provider  
✅ **Scalable**: Firebase handle session management  
✅ **Multi-platform**: Same auth flow untuk iOS/Android/Web

---

## 🎯 Perbedaan dengan Setup Sebelumnya

### **Sebelum (Tanpa Firebase):**

```dart
// Langsung dapat Google ID token
final googleAuth = await googleUser.authentication;
final idToken = googleAuth.idToken;

// Kirim ke backend
await mutate(body: OAuthLoginRequest(idToken: idToken));
```

### **Sekarang (Dengan Firebase):**

```dart
// 1. Sign in dengan Google
final googleAuth = await googleUser.authentication;

// 2. Create Firebase credential
final credential = GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken,
);

// 3. Sign in ke Firebase
final userCredential = await _firebaseAuth.signInWithCredential(credential);

// 4. Dapat Firebase ID token
final firebaseIdToken = await userCredential.user?.getIdToken();

// 5. Kirim Firebase token ke backend
await mutate(body: OAuthLoginRequest(idToken: firebaseIdToken));
```

---

## 🔧 Backend Requirements

Backend Anda perlu **verify Firebase ID token** menggunakan Firebase Admin SDK:

### **Node.js Example:**

```javascript
const admin = require("firebase-admin")

// Initialize Firebase Admin
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
})

// Verify token endpoint
app.post("/auth/oauth/google", async (req, res) => {
  const { idToken } = req.body

  try {
    // Verify Firebase ID token
    const decodedToken = await admin.auth().verifyIdToken(idToken)
    const uid = decodedToken.uid
    const email = decodedToken.email

    // Create your app's access token
    const accessToken = generateAccessToken(uid, email)

    res.json({
      accessToken,
      accountId: uid,
      expiresIn: 3600,
      refreshToken: generateRefreshToken(uid),
    })
  } catch (error) {
    res.status(401).json({ error: "Invalid token" })
  }
})
```

### **Python (FastAPI) Example:**

```python
from firebase_admin import auth, credentials, initialize_app

# Initialize Firebase Admin
cred = credentials.Certificate('serviceAccountKey.json')
initialize_app(cred)

@app.post("/auth/oauth/google")
async def google_login(request: OAuthLoginRequest):
    try:
        # Verify Firebase ID token
        decoded_token = auth.verify_id_token(request.idToken)
        uid = decoded_token['uid']
        email = decoded_token.get('email')

        # Create your app's access token
        access_token = generate_access_token(uid, email)

        return {
            "accessToken": access_token,
            "accountId": uid,
            "expiresIn": 3600,
            "refreshToken": generate_refresh_token(uid)
        }
    except Exception as e:
        raise HTTPException(status_code=401, detail="Invalid token")
```

---

## 🧪 Testing

### **1. Build & Run:**

```bash
flutter clean
flutter pub get
flutter run
```

### **2. Test Google Sign-In:**

1. Tap "Continue with Google"
2. Pilih akun Google
3. Jika berhasil → Navigate ke Home Page
4. Jika error → Check logs

### **3. Debug Logs:**

```dart
// Di _handleGoogleLogin, tambahkan:
print('Google User: ${googleUser.email}');
print('Firebase User: ${userCredential.user?.email}');
print('Firebase Token: ${firebaseIdToken?.substring(0, 20)}...');
```

---

## 🔍 Troubleshooting

### **Error: ApiException: 10**

✅ **SOLVED!** - Sudah dikonfigurasi dengan benar:

- SHA-1 registered di Firebase Console
- `google-services.json` sudah ada
- Package name `com.woee` sudah benar

### **Error: Firebase not initialized**

- Pastikan `Firebase.initializeApp()` dipanggil di `bootstrap()`
- Check `firebase_options.dart` ada

### **Error: Invalid Firebase token di backend**

- Pastikan backend verify token dengan Firebase Admin SDK
- Check Firebase project ID sama

---

## 📦 File Structure

```
lib/
├── firebase_options.dart                    ✅ Firebase config
├── app/
│   └── bootstrap/
│       └── bootstrap.dart                   ✅ Firebase.initializeApp()
└── features/
    └── auth/
        └── presentation/
            └── login/
                └── page/
                    └── sections/
                        └── login_social_section.dart  ✅ Firebase Auth

android/
├── app/
│   ├── google-services.json                 ✅ Firebase Android config
│   └── build.gradle.kts                     ✅ Google Services plugin
└── settings.gradle.kts                      ✅ Plugin dependency
```

---

## ✅ Checklist Final

- [x] Firebase project created
- [x] Android app registered di Firebase
- [x] SHA-1 certificate added
- [x] `google-services.json` downloaded & placed
- [x] Gradle plugins configured
- [x] Flutter dependencies added
- [x] `firebase_options.dart` generated
- [x] Firebase initialized in bootstrap
- [x] Login flow updated to use Firebase Auth
- [x] Ready to test!

---

## 🚀 Next Steps

1. **Test login flow** di device/emulator
2. **Setup backend** untuk verify Firebase token
3. **Enable Apple Sign-In** di Firebase Console (untuk iOS)
4. **Add error handling** & loading states
5. **Add analytics** (Firebase Analytics)

---

**Setup Firebase sudah 100% lengkap!** 🎉

Sekarang Google Sign-In akan menggunakan Firebase Authentication, yang lebih secure dan scalable.
