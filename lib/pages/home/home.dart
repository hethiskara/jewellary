import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Hi ${widget.username}",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Welcome",
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF9C353F),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(), // Remove HomePage from _buildScreens()
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13,

        // Other configuration properties...
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Homescreen(
        username: widget.username,
      ),
      WishlistScreen(),
      CartScreen(),
      MyOrdersScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: 'Home',
        activeColorPrimary: Color(0xFF9C353F),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: 'Wishlist',
        activeColorPrimary: Color(0xFF9C353F),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: 'Cart',
        activeColorPrimary: Color(0xFF9C353F),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.assignment),
        title: 'My Orders',
        activeColorPrimary: Color(0xFF9C353F),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  // Widget methods for category button and item card

  void addToWishlist(Map<String, dynamic> item) {
    Get.snackbar('Wishlist', 'Added ${item['name']} to wishlist');
  }

  void removeFromWishlist(Map<String, dynamic> item) {
    Get.snackbar('Wishlist', 'Removed ${item['name']} from wishlist');
  }
}

class Homescreen extends StatefulWidget {
  final String username;

  const Homescreen({Key? key, required this.username}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  String selectedCategory = 'All'; // Initialize with the default category

  List<Map<String, dynamic>> _items = [
    {
      'name': 'Necklace1',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item1.png', // Replace with the actual path
      'category': 'Necklaces'
    },
    {
      'name': 'Earring',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item2.png', // Replace with the actual path
      'category': 'Earrings'
    },
    {
      'name': 'Bangle',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item3.png', // Replace with the actual path
      'category': 'Bracelets'
    },
    {
      'name': 'Ring',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item4.png', // Replace with the actual path
      'category': 'Rings'
    },
    {
      'name': 'Necklace2',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item1.png', // Replace with the actual path
      'category': 'Necklaces'
    },
    {
      'name': 'Earring2',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item2.png', // Replace with the actual path
      'category': 'Earrings'
    },
    {
      'name': 'Bangle2',
      'price': '\$50',
      'isLiked': false,
      'imagePath': 'assets/item3.png', // Replace with the actual path
      'category': 'Bracelets'
    },
    // Your item data...
  ];

  List<Map<String, dynamic>> get filteredItems {
    if (selectedCategory == 'All') {
      return _items;
    } else {
      return _items
          .where((item) => item['category'] == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Hi ${widget.username}",
                            style: GoogleFonts.montserrat(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 48),
                          child: Text(
                            "Welcome",
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF9C353F),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                      child: Image.asset('assets/profile.png',
                          width: 50, height: 50),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15), // Adjust the radius as needed
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by the name of the jewel',
                        hintStyle: GoogleFonts.montserrat(
                          color: Color.fromARGB(255, 159, 157, 157),
                          fontSize: 15,
                        ),
                        filled: true,
                        fillColor: Colors
                            .transparent, // Set to transparent to see the rounded corners
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search_sharp,
                          size: 30,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 10),

                SizedBox(height: 30),
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF9C353F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 35,
                                right: 80,
                                left: 15,
                              ),
                              child: Text(
                                'New Model',
                                style: GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 242, 240, 240),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 2),
                              child: Text(
                                'Pendant Necklace',
                                style: GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFFCECA68)),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'View Necklace',
                                      style: GoogleFonts.montserrat(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Image.asset('assets/pendant.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2, top: 5),
                      child: Text('Categories',
                          style: GoogleFonts.montserrat(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, right: 8),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Color.fromARGB(255, 155, 18, 18),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildCategoryButton('All'),
                            SizedBox(width: 10),
                            buildCategoryButton('Earrings'),
                            SizedBox(width: 10),
                            buildCategoryButton('Necklaces'),
                            SizedBox(width: 10),
                            buildCategoryButton('Rings'),
                            SizedBox(width: 10),
                            buildCategoryButton('Bracelets'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Your other widgets...
                GridView.builder(
                  // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 35, // Adjust the spacing as needed
                    mainAxisSpacing: 10, // Adjust the spacing as needed
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredItems.length, // Use filteredItems.length
                  itemBuilder: (context, index) {
                    return buildItemCard(
                      filteredItems[index], // Use filtered items here
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    final isSelected = category == selectedCategory;

    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Color(0xFF9C353F) : Color.fromARGB(255, 220, 215, 215),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Text(
        category,
        style: GoogleFonts.montserrat(
          color: isSelected
              ? Colors.white
              : Colors.white, // Update color based on selection
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildItemCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 240, 233, 233), // Same color as above
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none, // Remove the grey border
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: item['imagePath'] != null
                    ? DecorationImage(
                        image: AssetImage(item['imagePath']),
                        // fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                item['name'] ?? '',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Rs: ${item['price'] ?? ''}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9C353F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          item['isLiked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item['isLiked'] ? Colors.red : null,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget for the Wishlist screen
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget for the Cart screen
  }
}

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget for the My Orders screen
  }
}
