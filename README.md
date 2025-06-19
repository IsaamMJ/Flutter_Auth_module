# Auth Module for Flutter

A modular authentication system for Flutter apps using **Supabase**, **GetX**, and **clean architecture** principles. This module provides login and signup UI pages, controllers, and use cases, all ready to plug into your project.

---

## 🚀 Features

* Supabase-backed authentication
* Clean separation of concerns (presentation, domain, data layers)
* Ready-to-use login and signup UI with form validation
* Dependency injection and routing using GetX
* Modular design for easy integration

---

## 📁 Project Structure

```
lib/
├── auth_module.dart               # Main export file
├── main.dart                      # Sample entry app
├── controller/                    # Login & Signup controllers
├── core/utils/                    # Validators
├── data/                          # Supabase data sources & repo implementations
├── domain/                        # Entities, repositories, and use cases
├── presentation/                 # UI pages and bindings
└── routes/                        # Route definitions
```

---

## 🧰 Dependencies

* [Flutter](https://flutter.dev)
* [GetX](https://pub.dev/packages/get)
* [Supabase Flutter](https://pub.dev/packages/supabase_flutter)

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  supabase_flutter: ^1.10.5
```

---

## 🛠️ Getting Started

### 1. Initialize Supabase

Update your `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'your-supabase-url',
    anonKey: 'your-anon-key',
  );

  AuthModule.init(
    AuthModuleConfig(supabaseClient: Supabase.instance.client),
  );

  runApp(const AuthPreviewApp());
}
```

### 2. Use the Module Routes

```dart
return GetMaterialApp(
  initialRoute: AuthRoutes.login,
  getPages: AuthPages.routes(),
);
```

---

## 🔐 Auth Flow

* **Login**: Handled by `LoginController` and `LoginUseCase`
* **Signup**: Handled by `SignUpController` and `SignUpUseCase`
* **Logout**: Via `AuthRepository.logout()` (optional UI)

All logic is abstracted for reuse and testing.

---

## 📸 UI Screenshots

* `LoginPage`: Email & password fields, validation, loading states
* `SignUpPage`: Includes confirm password and basic validators

---

## 🔄 Extending

You can extend the module by:

* Adding social login support via Supabase
* Listening to auth state changes for navigation
* Adding password reset or email verification

---

## 🧪 Testing

The separation of concerns allows easy mocking of use cases for unit testing. You can also replace `AuthRepositoryImpl` with a mock for integration tests.

---

## 📄 License

MIT – Feel free to use and modify.

