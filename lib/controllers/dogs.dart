
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common.dart';

final selectedBreedProvider = StateProvider<String>((ref) => '');

final dogBreedsProvider = FutureProvider<List<String>>((ref) => fetchDogBreeds());

final dogImagesProvider = FutureProvider.family<List<String>, String>((ref, breedName) async {
  try {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breedName/images'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['message'];
      return data.cast<String>().toList();
    } else {
      throw Exception('Failed to load dog images');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching dog images: $e');
    }
    rethrow; // Rethrow the error
  }
});

final breedNameProvider = Provider<String>((ref) {
  final route = ModalRoute.of(ref.watch(navigatorKeyProvider).currentContext!)!;
  return route.settings.arguments as String;
});

Future<List<String>> fetchDogBreeds() async {
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['message'];
    return data.cast<String>().toList();
  } else {
    throw Exception('Failed to load dog breeds');
  }
}