import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double price;

  Product(this.name, this.description, this.price);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 244, 245), 
      ),
      home: ProductListScreen(),
    );
  }
}


class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product("Teddy Bear", "Soft and cute teddy bear for kids", 25),
    Product("Toy Car", "Small toy car with bright colors", 15),
    Product("Building Blocks", "Colorful blocks for creative play", 30),
    Product("Kids Backpack", "Lightweight backpack for school", 40),
    Product("Drawing Kit", "Crayons and coloring book set", 20),
    Product("Puzzle Game", "Fun puzzle to improve thinking skills", 18),
    Product("Baby Doll", "Cute doll for imaginative play", 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kids Products"),
        backgroundColor: const Color.fromARGB(255, 233, 140, 171), // 🎨 لون AppBar
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text("\$${products[index].price}"),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: products[index]),
                  ),
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result)),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: const Color.fromARGB(255, 234, 152, 179),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Price: \$${product.price}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 222, 138, 166),
                ),
                child: Text("رجوع مع تأكيد"),
                onPressed: () {
                  Navigator.pop(
                      context, "تم الرجوع من ${product.name}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}