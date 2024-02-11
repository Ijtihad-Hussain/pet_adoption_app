import 'package:flutter/material.dart';

class DogBreedTile extends StatelessWidget {
  final String breedName;
  final String? breedImage;
  final VoidCallback onTap;

  const DogBreedTile({
    super.key,
    required this.breedName,
    required this.onTap,
    this.breedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text(
          breedName,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
        trailing: CircleAvatar(
          backgroundImage: NetworkImage(breedImage ?? ''),
        ),
      ),
    );
  }
}
