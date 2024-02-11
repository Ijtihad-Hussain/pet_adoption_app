

import 'package:flutter/material.dart';

class DogImageTile extends StatelessWidget {
  final String imageUrl;
  const DogImageTile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
