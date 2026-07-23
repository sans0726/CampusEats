import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}


class _RegisterScreenState
    extends State<RegisterScreen> {

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();


  bool isLoading = false;


  @override
  void dispose() {

    nameController.dispose();

    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }


  // ==============================
  // REGISTER USER
  // ==============================

  Future<void> registerUser() async {

    // Check empty fields

    if (
      nameController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      passwordController.text.isEmpty
    ) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );

      return;
    }


    setState(() {
      isLoading = true;
    });


    try {

      // FastAPI backend URL

      final url = Uri.parse(
        "http://10.22.163.246:8000/auth/register",
      );


      // Send request

      final response = await http.post(

        url,

        headers: {
          "Content-Type":
              "application/json",
        },

        body: jsonEncode({

          "full_name":
              nameController.text.trim(),

          "email":
              emailController.text.trim(),

          "password":
              passwordController.text,

        }),
      );


      final data =
          jsonDecode(response.body);


      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        // Registration successful

        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Account created successfully 🎉",
            ),
          ),
        );


        // Clear fields

        nameController.clear();

        emailController.clear();

        passwordController.clear();


        // Go back to previous screen

        Navigator.pop(context);

      } else {

        // Backend error

        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              data["detail"] ??
                  "Registration failed",
            ),
          ),
        );
      }

    } catch (e) {

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Could not connect to server",
          ),
        ),
      );

      print(e);

    } finally {

      if (mounted) {

        setState(() {
          isLoading = false;
        });

      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Create Account",
        ),
      ),


      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(24),


        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [

            const SizedBox(
              height: 20,
            ),


            const Text(
              "Join CampusEats 🎉",

              style: TextStyle(
                fontSize: 30,
                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(
              height: 10,
            ),


            const Text(
              "Create your account and start ordering.",

              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),


            const SizedBox(
              height: 35,
            ),


            const Text(
              "Full Name",

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
                  nameController,

              decoration:
                  const InputDecoration(

                hintText:
                    "Enter your full name",

                prefixIcon:
                    Icon(
                  Icons.person_outline,
                ),
              ),
            ),


            const SizedBox(
              height: 20,
            ),


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
                    Icon(
                  Icons.email_outlined,
                ),
              ),
            ),


            const SizedBox(
              height: 20,
            ),


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

              obscureText: true,

              decoration:
                  const InputDecoration(

                hintText:
                    "Create a password",

                prefixIcon:
                    Icon(
                  Icons.lock_outline,
                ),
              ),
            ),


            const SizedBox(
              height: 35,
            ),


            SizedBox(

              width:
                  double.infinity,


              height: 55,


              child:
                  ElevatedButton(

                onPressed:
                    isLoading
                        ? null
                        : registerUser,


                child:

                    isLoading

                        ? const SizedBox(

                            height: 24,

                            width: 24,

                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )

                        : const Text(
                            "Create Account",
                          ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}