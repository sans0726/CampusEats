import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryColor = Color(0xFFFF6B35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            15,
            20,
            30,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // =========================
              // HEADER
              // =========================

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Good Morning 👋",

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Sanskruti",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  Row(
                    children: [

                      // Notification

                      Container(
                        decoration:
                            BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.05),
                              blurRadius: 10,
                            ),
                          ],
                        ),

                        child: IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons
                                .notifications_none,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Profile

                      Container(
                        height: 45,
                        width: 45,

                        decoration:
                            BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                              BorderRadius.circular(
                            15,
                          ),
                        ),

                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),


              // =========================
              // TITLE
              // =========================

              const Text(
                "What are you craving?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),


              // =========================
              // SEARCH BAR
              // =========================

              Container(
                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    18,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.04),

                      blurRadius: 12,

                      offset:
                          const Offset(0, 4),
                    ),
                  ],
                ),

                child: TextField(

                  decoration:
                      InputDecoration(

                    hintText:
                        "Search food or canteen...",

                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),

                    prefixIcon:
                        const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),

                    suffixIcon:
                        IconButton(
                      icon:
                          const Icon(
                        Icons.tune,
                      ),

                      onPressed: () {},
                    ),

                    border:
                        InputBorder.none,

                    contentPadding:
                        const EdgeInsets
                            .symmetric(
                      vertical: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),


              // =========================
              // CATEGORIES
              // =========================

              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},

                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),


              SizedBox(
                height: 110,

                child: ListView(
                  scrollDirection:
                      Axis.horizontal,

                  children: const [

                    CategoryCard(
                      icon:
                          Icons.local_pizza,
                      name: "Pizza",
                    ),

                    CategoryCard(
                      icon:
                          Icons.fastfood,
                      name: "Burger",
                    ),

                    CategoryCard(
                      icon:
                          Icons.ramen_dining,
                      name: "Noodles",
                    ),

                    CategoryCard(
                      icon:
                          Icons.local_cafe,
                      name: "Drinks",
                    ),

                    CategoryCard(
                      icon:
                          Icons.rice_bowl,
                      name: "Meals",
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 25),


              // =========================
              // POPULAR FOOD
              // =========================

              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  const Text(
                    "Popular Near You 🔥",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},

                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),


              // Food Cards

              SizedBox(
                height: 235,

                child: ListView(
                  scrollDirection:
                      Axis.horizontal,

                  children: const [

                    FoodCard(
                      name:
                          "Veg Cheese Burger",

                      canteen:
                          "Campus Canteen",

                      price:
                          "₹80",

                      rating:
                          "4.7",

                      icon:
                          Icons.fastfood,
                    ),

                    FoodCard(
                      name:
                          "Margherita Pizza",

                      canteen:
                          "Food Hub",

                      price:
                          "₹120",

                      rating:
                          "4.8",

                      icon:
                          Icons.local_pizza,
                    ),

                    FoodCard(
                      name:
                          "Masala Dosa",

                      canteen:
                          "South Corner",

                      price:
                          "₹70",

                      rating:
                          "4.6",

                      icon:
                          Icons.rice_bowl,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),


              // =========================
              // CANTEENS
              // =========================

              const Text(
                "Popular Canteens 🏪",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),


              const CanteenCard(
                name:
                    "Campus Canteen",

                subtitle:
                    "Fast food • Snacks • Drinks",

                rating:
                    "4.7",

                icon:
                    Icons.storefront,
              ),

              const SizedBox(height: 12),

              const CanteenCard(
                name:
                    "Food Hub",

                subtitle:
                    "Pizza • Burgers • Meals",

                rating:
                    "4.8",

                icon:
                    Icons.restaurant,
              ),

            ],
          ),
        ),
      ),


      // =========================
      // BOTTOM NAVIGATION
      // =========================

      bottomNavigationBar:
          NavigationBar(

        selectedIndex: 0,

        destinations: const [

          NavigationDestination(
            icon:
                Icon(Icons.home_outlined),

            selectedIcon:
                Icon(Icons.home),

            label:
                "Home",
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.receipt_long_outlined,
            ),

            selectedIcon:
                Icon(
              Icons.receipt_long,
            ),

            label:
                "Orders",
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.shopping_cart_outlined,
            ),

            selectedIcon:
                Icon(
              Icons.shopping_cart,
            ),

            label:
                "Cart",
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.person_outline,
            ),

            selectedIcon:
                Icon(
              Icons.person,
            ),

            label:
                "Profile",
          ),

        ],
      ),
    );
  }
}


// =================================
// CATEGORY CARD
// =================================

class CategoryCard
    extends StatelessWidget {

  final IconData icon;

  final String name;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
  });


  @override
  Widget build(
      BuildContext context) {

    return Container(

      width: 90,

      margin:
          const EdgeInsets.only(
        right: 12,
      ),

      decoration:
          BoxDecoration(

        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          18,
        ),

        boxShadow: [

          BoxShadow(

            color:
                Colors.black
                    .withOpacity(
              0.04,
            ),

            blurRadius:
                10,

            offset:
                const Offset(
              0,
              4,
            ),
          ),

        ],
      ),

      child: Column(

        mainAxisAlignment:
            MainAxisAlignment
                .center,

        children: [

          Container(

            height: 50,

            width: 50,

            decoration:
                BoxDecoration(

              color:
                  const Color(
                0xFFFFE4D6,
              ),

              borderRadius:
                  BorderRadius.circular(
                15,
              ),
            ),

            child:
                Icon(

              icon,

              size: 28,

              color:
                  HomeScreen
                      .primaryColor,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(

            name,

            style:
                const TextStyle(

              fontWeight:
                  FontWeight.w600,

              fontSize:
                  13,
            ),
          ),

        ],
      ),
    );
  }
}


// =================================
// FOOD CARD
// =================================

class FoodCard
    extends StatelessWidget {

  final String name;

  final String canteen;

  final String price;

  final String rating;

  final IconData icon;


  const FoodCard({

    super.key,

    required this.name,

    required this.canteen,

    required this.price,

    required this.rating,

    required this.icon,

  });


  @override
  Widget build(
      BuildContext context) {

    return Container(

      width: 190,

      margin:
          const EdgeInsets.only(
        right: 15,
      ),

      decoration:
          BoxDecoration(

        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          20,
        ),

        boxShadow: [

          BoxShadow(

            color:
                Colors.black
                    .withOpacity(
              0.05,
            ),

            blurRadius:
                12,

            offset:
                const Offset(
              0,
              5,
            ),
          ),

        ],
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment
                .start,

        children: [

          Container(

            height: 110,

            width:
                double.infinity,

            decoration:
                const BoxDecoration(

              color:
                  Color(
                0xFFFFE4D6,
              ),

              borderRadius:
                  BorderRadius.only(

                topLeft:
                    Radius.circular(
                  20,
                ),

                topRight:
                    Radius.circular(
                  20,
                ),

              ),
            ),

            child:
                Icon(

              icon,

              size: 55,

              color:
                  HomeScreen
                      .primaryColor,
            ),
          ),


          Padding(

            padding:
                const EdgeInsets.all(
              12,
            ),

            child:
                Column(

              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                Text(

                  name,

                  maxLines:
                      1,

                  overflow:
                      TextOverflow
                          .ellipsis,

                  style:
                      const TextStyle(

                    fontWeight:
                        FontWeight.bold,

                    fontSize:
                        15,
                  ),
                ),

                const SizedBox(
                  height: 4,
                ),

                Text(

                  canteen,

                  style:
                      const TextStyle(

                    color:
                        Colors.grey,

                    fontSize:
                        12,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                Row(

                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [

                    Text(

                      price,

                      style:
                          const TextStyle(

                        fontWeight:
                            FontWeight.bold,

                        fontSize:
                            17,

                        color:
                            HomeScreen
                                .primaryColor,
                      ),
                    ),

                    Row(

                      children: [

                        const Icon(

                          Icons.star,

                          size: 16,

                          color:
                              Colors.amber,
                        ),

                        const SizedBox(
                          width: 3,
                        ),

                        Text(
                          rating,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}


// =================================
// CANTEEN CARD
// =================================

class CanteenCard
    extends StatelessWidget {

  final String name;

  final String subtitle;

  final String rating;

  final IconData icon;


  const CanteenCard({

    super.key,

    required this.name,

    required this.subtitle,

    required this.rating,

    required this.icon,

  });


  @override
  Widget build(
      BuildContext context) {

    return Container(

      padding:
          const EdgeInsets.all(
        15,
      ),

      decoration:
          BoxDecoration(

        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          18,
        ),

        boxShadow: [

          BoxShadow(

            color:
                Colors.black
                    .withOpacity(
              0.04,
            ),

            blurRadius:
                10,
          ),

        ],
      ),

      child: Row(

        children: [

          Container(

            height: 55,

            width: 55,

            decoration:
                BoxDecoration(

              color:
                  const Color(
                0xFFFFE4D6,
              ),

              borderRadius:
                  BorderRadius.circular(
                15,
              ),
            ),

            child:
                Icon(

              icon,

              color:
                  HomeScreen
                      .primaryColor,

              size: 30,
            ),
          ),

          const SizedBox(
            width: 15,
          ),

          Expanded(

            child:
                Column(

              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                Text(

                  name,

                  style:
                      const TextStyle(

                    fontWeight:
                        FontWeight.bold,

                    fontSize:
                        16,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Text(

                  subtitle,

                  style:
                      const TextStyle(

                    color:
                        Colors.grey,

                    fontSize:
                        12,
                  ),
                ),

              ],
            ),
          ),

          Row(

            children: [

              const Icon(

                Icons.star,

                color:
                    Colors.amber,

                size:
                    17,
              ),

              const SizedBox(
                width: 3,
              ),

              Text(
                rating,

                style:
                    const TextStyle(

                  fontWeight:
                      FontWeight.bold,
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}