import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();

    Timer(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Color(0xFFFF6B35),
              Color(0xFFFF8A5B),
              Color(0xFFFFB38A),
            ],
          ),
        ),

        child: AnimatedBuilder(
          animation: _controller,

          builder: (context, child) {

            return FadeTransition(
              opacity: _fadeAnimation,

              child: ScaleTransition(
                scale: _scaleAnimation,

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    // Logo
                    Container(
                      height: 120,
                      width: 120,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                          35,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.15),

                            blurRadius: 25,

                            offset:
                                const Offset(
                              0,
                              10,
                            ),
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.restaurant_menu,
                        size: 65,
                        color:
                            Color(0xFFFF6B35),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    // App name
                    const Text(
                      "CampusEats",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight:
                            FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // Tagline
                    const Text(
                      "Your Campus. Your Food. Your Way.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w500,
                      ),
                    ),

                    const SizedBox(
                      height: 60,
                    ),

                    // Loading indicator
                    const SizedBox(
                      width: 30,
                      height: 30,

                      child:
                          CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}