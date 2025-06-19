# 🔐 Auth Module for Flutter

**A complete, standalone authentication module built with Flutter**, designed to work both:

* ✅ As a **standalone app** for development and preview
* 🔗 As a **pluggable module** to integrate into larger applications

---

## 🚀 Features

* 📦 **Modular**: Plug & play architecture
* 📱 **Standalone App Mode**: Run independently for testing and development
* 🔒 **Supabase Auth Integration**
* 🎨 **Login & Signup UI included**
* 🧠 **Clean Architecture**: Separation of concerns
* ⚙️ **GetX** for routing, state, and DI

---

## 📁 Project Structure

```
lib/
├── main.dart                      # Standalone app entry
├── auth_module.dart               # Exports for integration
├── controller/                    # Business logic (Login, Signup)
├── core/utils/                    # Validators
├── data/                          # Supabase auth implementation
├── domain/                        # Use cases, entities, repositories
├── presentation/                 # Pages and Bindings
└── routes/                        # Auth routes
```

---

## 🧰 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  supabase_flutter: ^1.10.5
```

---

## 🛠️ Getting Started

### ✅ 1. Standalone App (Preview Mode)

Run this project as a Flutter app directly:

```bash
flutter run
```

This launches the `AuthPreviewApp`, pre-configured with Supabase:

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

---

### 🔗 2. Integration into Another App

Import the module and use it in your app:

```dart
import 'package:auth_module/auth_module.dart';

void main() {
  AuthModule.init(
    AuthModuleConfig(supabaseClient: Supabase.instance.client),
  );

  runApp(GetMaterialApp(
    initialRoute: AuthRoutes.login,
    getPages: AuthPages.routes(),
  ));
}
```

---

## 🧪 Auth Flow

* **Login & Signup** handled with domain-driven use cases
* **Email validation**, **password confirmation**, and **session feedback**
* **Logout** capability included via `AuthRepository`

---

## 🎨 UI Previews

* Modern, form-validated login and signup pages
* Obx-based loading and state feedback
* Built using Material Design

---

## 🔄 Extendable

Easily extend the module with:

* 🔄 Social logins
* 🔐 Email verification
* 🔁 Password reset
* 🧪 Custom validators

---

## 🧪 Testing

* Clean architecture enables unit testing
* Swap `AuthRepository` with mock for integration tests

---

## 📄 License

MIT – Use it, extend it, share it.
