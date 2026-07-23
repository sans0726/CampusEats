import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // Greeting
              const Text(
                "Good Morning 👋",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "What are you craving?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search food or canteen...",
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.tune,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Categories
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 100,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: const [

                    CategoryCard(
                      icon: Icons.local_pizza,
                      name: "Pizza",
                    ),

                    CategoryCard(
                      icon: Icons.fastfood,
                      name: "Burger",
                    ),

                    CategoryCard(
                      icon: Icons.local_cafe,
                      name: "Drinks",
                    ),

                    CategoryCard(
                      icon: Icons.rice_bowl,
                      name: "Meals",
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Popular section
              const Text(
                "Popular Near You 🔥",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Food card
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.05),

                      blurRadius: 15,

                      offset: const Offset(
                        0,
                        5,
                      ),
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    Container(
                      height: 80,
                      width: 80,

                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFFFE4D6,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                          16,
                        ),
                      ),

                      child: const Icon(
                        Icons.fastfood,
                        size: 40,
                        color: Color(
                          0xFFFF6B35,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Veg Cheese Burger",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Campus Canteen",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "₹80",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.add_circle,
                        color: Color(
                          0xFFFF6B35,
                        ),
                        size: 32,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar:
          NavigationBar(
        selectedIndex: 0,

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon:
                Icon(Icons.home),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(
              Icons.receipt_long_outlined,
            ),
            selectedIcon:
                Icon(Icons.receipt_long),
            label: "Orders",
          ),

          NavigationDestination(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            selectedIcon:
                Icon(Icons.shopping_cart),
            label: "Cart",
          ),

          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
            ),
            selectedIcon:
                Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {

  final IconData icon;
  final String name;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 85,

      margin: const EdgeInsets.only(
        right: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.04),

            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 32,
            color: const Color(
              0xFFFF6B35,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}