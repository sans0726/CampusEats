import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(
                height: 50,
              ),

              // Icon
              Container(
                height: 65,
                width: 65,

                decoration:
                    BoxDecoration(
                  color:
                      const Color(
                    0xFFFFE4D6,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child: const Icon(
                  Icons.restaurant_menu,
                  color:
                      Color(0xFFFF6B35),
                  size: 35,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                "Welcome Back! 👋",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Login to continue ordering delicious food.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              // Email
              const Text(
                "Email",
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              TextField(
                controller:
                    emailController,

                keyboardType:
                    TextInputType
                        .emailAddress,

                decoration:
                    const InputDecoration(
                  hintText:
                      "Enter your email",
                  prefixIcon:
                      Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Password
              const Text(
                "Password",
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              TextField(
                controller:
                    passwordController,

                obscureText:
                    obscurePassword,

                decoration:
                    InputDecoration(
                  hintText:
                      "Enter your password",

                  prefixIcon:
                      const Icon(
                    Icons.lock_outline,
                  ),

                  suffixIcon:
                      IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons
                              .visibility_off
                          : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        obscurePassword =
                            !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              Align(
                alignment:
                    Alignment.centerRight,

                child: TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Forgot Password?",
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Login button
              ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          const HomeScreen(),
                    ),
                  );

                },

                child:
                    const Text("Login"),
              ),

              const SizedBox(
                height: 25,
              ),

              // Register
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  const Text(
                    "Don't have an account? ",
                  ),

                  TextButton(
                    onPressed: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  const RegisterScreen(),
                        ),
                      );

                    },

                    child: const Text(
                      "Register",
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}