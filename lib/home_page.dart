import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import profile_page.dart
import 'my_cart.dart';

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page App'),
      routes: {
        '/profile': (context) => ProfilePage(), // Tambahkan rute untuk ProfilePage
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          _buildSearchBar(),
          _buildSectionTitle('Menu'),
          _buildMenuIcons(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsPage()),
              );
            },
            child: _buildSectionTitle('All Product'), // Navigate to All Products
          ),
          _buildSectionTitle('Checkout'),
          _buildSectionTitle('Profile'),
          _buildDiscountCard(),
          _buildPromoCard(),
          _buildProductCards(),
          _buildProductDetails(
            'Toyota Avanza',
            '₹1500',
            '₹2499',
            '40% Off',
            '56890',
            'Description',
          ),
          _buildProductDetails(
            'Toyota Raize',
            '₹2499',
            '₹4999',
            '50% Off',
            '344567',
            'Neque porro quisquam est qui dolorem ipsum quia',
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile'); // Navigasi ke ProfilePage
          },
          icon: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Padding _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search any Product..',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _buildMenuIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 30,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
          ),
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 30,
          ),
        ],
      ),
    );
  }

  Container _buildDiscountCard() {
    return Container(
      height: 200,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/shopping_bag.png',
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50-40% OFF',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Now in (product)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'All colours',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildPromoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Promo of the Day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text(
                'View all',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildProductCards() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildProductCard('Toyota Avanza'),
          _buildProductCard('Toyota Raize'),
        ],
      ),
    );
  }

  Container _buildProductCard(String productName) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: Text(
          productName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding _buildProductDetails(
    String productName,
    String price,
    String originalPrice,
    String discount,
    String ratings,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            originalPrice,
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            discount,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            ratings,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class AllProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: Center(
        child: Text('All Products Page'),
      ),
    );
  }
}

void main() {
  runApp(HomePageApp());
}
