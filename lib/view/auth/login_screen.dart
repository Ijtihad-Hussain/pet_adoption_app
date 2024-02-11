import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/view/home_screen.dart';
import 'package:pet_adoption_app/view/auth/registration_screen.dart';

import '../../controllers/common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Consumer(builder: (context, ref, _) {
              final passwordVisible = ref.watch(passwordVisibleProvider);
              return TextFormField(
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      ref.read(passwordVisibleProvider.notifier).state = !passwordVisible;
                    },
                  ),
                ),
              );
            }),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
              child: const Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}
