import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/dogs.dart';
import '../../../utils/utils.dart';
import '../../widgets/dog_breed_tile.dart';

class DogsPage extends ConsumerWidget {
  const DogsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogBreedsAsync = ref.watch(dogBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: dogBreedsAsync.when(
        data: (dogBreeds) {
          return ListView.builder(
            padding: const EdgeInsets.all(20.0),
            itemCount: dogBreeds.length,
            itemBuilder: (context, index) {
              final dogBreed = capitalizeFirstLetter(dogBreeds[index]);
              final dogImagesAsync = ref.watch(dogImagesProvider(dogBreeds[index]));

              return dogImagesAsync.when(
                data: (breedImages) {
                  final breedImage = breedImages != null && index < breedImages.length ? breedImages[index] : null;

                  return DogBreedTile(
                    breedImage: breedImage,
                    breedName: dogBreed,
                    onTap: () {
                      ref.read(selectedBreedProvider.notifier).state = dogBreeds[index];
                      Navigator.pushNamed(context, '/dogsOfBreed');
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(child: Text('Error: $error')),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
