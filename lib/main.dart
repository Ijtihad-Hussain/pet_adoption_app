import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/view/auth/registration_screen.dart';
import 'package:pet_adoption_app/view/categories/dogs/dogs_breed_page.dart';
import 'package:pet_adoption_app/view/categories/dogs/dogs_page.dart';
import 'package:pet_adoption_app/view/home_screen.dart';

import 'view/auth/login_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/dogs': (context) => DogsPage(),
        '/dogsOfBreed': (context) => DogsBreedPage(),
      },
    );
  }
}
