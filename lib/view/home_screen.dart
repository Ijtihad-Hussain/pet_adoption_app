import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Pet Adoption App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recent Updates',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Arrivals!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Check out our latest additions to the adoption center!',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Explore Categories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryCard(
                  image: AssetImage('assets/images/dog.png'),
                  label: 'Dogs',
                  onTap: () {
                    Navigator.pushNamed(context, '/dogs');
                  },
                ),
                _buildCategoryCard(
                  image: AssetImage('assets/images/cat.png'),
                  label: 'Cats',
                  onTap: () {
                    // Handle cat category
                  },
                ),
                _buildCategoryCard(
                  image: AssetImage('assets/images/bird.png'),
                  label: 'Birds',
                  onTap: () {
                    // Handle bird category
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required AssetImage image, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: Image(
                image: image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
