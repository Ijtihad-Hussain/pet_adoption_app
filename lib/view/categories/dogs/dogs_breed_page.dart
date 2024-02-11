
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/utils/utils.dart';
import 'package:pet_adoption_app/view/widgets/dog_image_tile.dart';

import '../../../controllers/dogs.dart';

class DogsBreedPage extends ConsumerWidget {
  const DogsBreedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBreed = ref.watch(selectedBreedProvider.notifier);
    final breedName = selectedBreed.state;
    final dogImagesAsync = ref.watch(dogImagesProvider(selectedBreed.state));

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: capitalizeFirstLetter(breedName),
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: ' Dogs',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      body: dogImagesAsync.when(
        data: (dogImages) {
          return GridView.builder(
            padding: const EdgeInsets.all(20.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: dogImages.length,
            itemBuilder: (context, index) {
              return DogImageTile(imageUrl: dogImages[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
