# Medpoint Mobile

A mobile app for medpoint system

Aplikasi Mobile yang memiliki fitur utama:
1. User, Registrasi, Login dan Mengelola profil pribadi
2. Payment, Billing dan melakukan pembayaran
3. Notifications, Allow to recieves and read notifications
4. Reservation, Search, booking dan membatalkan reservasi

### Teknologi yang digunakan:
* Language: Dart
* Framework: Flutter

### Struktur Folder Project:
```
├── android
├── assets                  # To save assets file (font, images, etc)
│   ├── fonts               # To save fonts file
│   ├── icons               # To save icons file
│   ├── images              # To save images file
│   └── logos               # To save logo brand etc
├── ios
├── lib
│    ├── common
│    │   ├── styles         # Used to place all the common styles
│    │   └── widget         # Used to place all the common widgets
│    ├── data
│    │   ├── repositories
│    │   └── service        # Used to be dealing with apis
│    ├── features           # Used to store features in app
│    ├── utils              # Used to store utilities that can be useful, such as date time format etc
│    ├── app.dart
│    └── main.dart
├── test                    # Used to store unit test components, function etc
└── pubspec.yaml
```

### How to Run
1. Make sure flutter is installed in your machine
2. Run `flutter pub get`
3. Run `flutter run`
