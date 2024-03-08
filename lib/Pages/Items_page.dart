import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Items Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: const [
          // Item 1
          ItemCard(
            imageUrl:
                'https://t4.ftcdn.net/jpg/03/24/42/21/360_F_324422176_Lgn7NTeFyNaUKIDu0Ppls1u8zb8wsKS4.jpg',
            Category: 'Item 1',
            Brand: 'Acer',
            Quantity: '25 units',
          ),

          // Keyboard
          ItemCard(
            imageUrl:
                'https://images.pexels.com/photos/12211/pexels-photo-12211.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            Category: 'Keyboard',
            Brand: 'Acer',
            Quantity: '25 units',
          ),
          ItemCard(
            imageUrl:
                'https://images.pexels.com/photos/12211/pexels-photo-12211.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            Category: 'Keyboard',
            Brand: 'Acer',
            Quantity: '25 units',
          ),
          ItemCard(
            imageUrl:
                'https://images.pexels.com/photos/12211/pexels-photo-12211.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            Category: 'Keyboard',
            Brand: 'Acer',
            Quantity: '25 units',
          ),
          ItemCard(
            imageUrl:
                'https://images.pexels.com/photos/12211/pexels-photo-12211.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            Category: 'Keyboard',
            Brand: 'Acer',
            Quantity: '25 units',
          ),
          ItemCard(
            imageUrl:
                'https://images.pexels.com/photos/12211/pexels-photo-12211.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            Category: 'Keyboard',
            Brand: 'Acer',
            Quantity: '25 units',
          )

          // Add more ItemCards as needed
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String Category;
  final String Brand;
  final String Quantity;

  const ItemCard({
    super.key,
    required this.imageUrl,
    required this.Category,
    required this.Brand,
    required this.Quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Image Column
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // Details Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category: $Category',
                  ),
                  Text('Price: $Brand'),
                  Text('Quantity: $Quantity'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
