# API Response Wrapper

## 📦 Struktur Response Backend

Semua response dari backend Anda mengikuti format standar:

```json
{
  "success": true,
  "data": {
    "account_id": "4729702d-43c3-488e-a96e-b05157ca6654",
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "refresh_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "expires_in": 900
  }
}
```

Atau untuk list:

```json
{
  "success": true,
  "data": [
    { "id": 1, "title": "Post 1" },
    { "id": 2, "title": "Post 2" }
  ]
}
```

---

## ✅ Solusi: ApiResponse Wrapper

Saya sudah membuat wrapper generic `ApiResponse<T>` yang otomatis unwrap response dari backend.

### **File**: `lib/core/network/dto/api_response.dart`

```dart
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
  });

  /// For single object responses
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool,
      data: fromJsonT(json['data'] as Map<String, dynamic>),
    );
  }

  /// For list responses
  factory ApiResponse.fromJsonList(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool,
      data: fromJsonT(json['data']),
    );
  }

  final bool success;
  final T data;
}
```

---

## 🎯 Cara Penggunaan

### **1. Single Object Response**

**Endpoint**: `/auth/oauth/google`

**Response**:

```json
{
  "success": true,
  "data": {
    "account_id": "xxx",
    "access_token": "yyy",
    "refresh_token": "zzz",
    "expires_in": 900
  }
}
```

**Kode**:

```dart
static final loginWithGoogle =
    MutationEndpoint<OAuthLoginResponse, void, OAuthLoginRequest>(
      path: '/auth/oauth/google',
      method: HttpMethod.post,
      fromJson: (json) {
        // Unwrap ApiResponse wrapper
        final response = ApiResponse<OAuthLoginResponse>.fromJson(
          json as Map<String, dynamic>,
          OAuthLoginResponse.fromJson,
        );
        // Return hanya data-nya
        return response.data;
      },
      invalidatesTags: ['user', 'auth'],
    );
```

### **2. List Response**

**Endpoint**: `/posts`

**Response**:

```json
{
  "success": true,
  "data": [
    { "id": 1, "title": "Post 1", "content": "..." },
    { "id": 2, "title": "Post 2", "content": "..." }
  ]
}
```

**Kode**:

```dart
static final getPosts = SimpleQueryEndpoint<List<Post>>(
  path: '/posts',
  fromJson: (json) {
    // Unwrap ApiResponse wrapper untuk list
    final response = ApiResponse<List<GetPostsResponse>>.fromJsonList(
      json as Map<String, dynamic>,
      (data) => GetPostsResponse.fromJsonList(data),
    );
    // Return hanya data-nya
    return PostMapper.fromGetPostsResponseList(response.data);
  },
  cachePolicy: const CachePolicy(ttlSeconds: 300, tags: ['posts']),
);
```

---

## 📝 File yang Sudah Diupdate

### ✅ Auth Endpoints

**File**: `lib/features/auth/data/api/auth_endpoints.dart`

- ✅ `loginWithGoogle` - Unwrap `ApiResponse<OAuthLoginResponse>`
- ✅ `loginWithApple` - Unwrap `ApiResponse<OAuthLoginResponse>`
- ✅ `refreshToken` - Unwrap `ApiResponse<RefreshResponse>`

### ✅ Post Endpoints

**File**: `lib/features/home/data/api/post_endpoints.dart`

- ✅ `getPosts` - Unwrap `ApiResponse<List<GetPostsResponse>>`
- ✅ `getPost` - Unwrap `ApiResponse<GetPostsResponse>`
- ✅ `getPostsByCategory` - Unwrap `ApiResponse<List<GetPostsResponse>>`
- ✅ `createPost` - Unwrap `ApiResponse<GetPostsResponse>`
- ✅ `updatePost` - Unwrap `ApiResponse<GetPostsResponse>`
- ✅ `deletePost` - Check `success` field

---

## 🔍 Perbedaan fromJson vs fromJsonList

### **fromJson** - Untuk single object

```dart
// Backend response:
// { "success": true, "data": { "id": 1, "name": "John" } }

ApiResponse<User>.fromJson(
  json,
  User.fromJson,  // Expects Map<String, dynamic>
)
```

### **fromJsonList** - Untuk array/list

```dart
// Backend response:
// { "success": true, "data": [{ "id": 1 }, { "id": 2 }] }

ApiResponse<List<User>>.fromJsonList(
  json,
  (data) => User.fromJsonList(data),  // Expects List<dynamic>
)
```

---

## 🎨 Pattern yang Konsisten

Semua endpoint sekarang mengikuti pattern yang sama:

```dart
static final yourEndpoint = Endpoint<YourType, ...>(
  path: '/your/path',
  fromJson: (json) {
    // 1. Unwrap ApiResponse
    final response = ApiResponse<YourDTO>.fromJson(
      json as Map<String, dynamic>,
      YourDTO.fromJson,
    );

    // 2. Transform DTO ke Entity (optional)
    return YourMapper.fromDTO(response.data);

    // Atau langsung return data
    // return response.data;
  },
);
```

---

## ✅ Keuntungan

1. **Konsisten**: Semua endpoint handle response dengan cara yang sama
2. **Type-safe**: Compiler akan error jika format salah
3. **Maintainable**: Mudah update jika backend ubah format
4. **Reusable**: `ApiResponse` bisa dipakai di semua endpoint
5. **Clean**: DTO tetap simple, wrapper logic terpisah

---

## 🧪 Testing

Setelah perubahan ini, test login flow:

```bash
flutter clean
flutter pub get
flutter run
```

Response dari backend akan otomatis di-unwrap, jadi kode Anda hanya terima `data` field saja.

---

## 📌 Catatan Penting

- ✅ **Tidak perlu code generation** - `ApiResponse` pure Dart class
- ✅ **DTO tetap sama** - `OAuthLoginResponse`, `GetPostsResponse`, dll tidak berubah
- ✅ **Backward compatible** - Jika backend ubah format, tinggal update `ApiResponse`
- ✅ **Error handling** - Jika `success: false`, bisa ditambahkan logic di `ApiResponse`

---

**Semua endpoint sudah siap handle response format backend Anda!** 🎉
