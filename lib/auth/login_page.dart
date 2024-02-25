import 'package:flutter/material.dart';
import 'package:untitled5/auth/signup_page.dart';

import 'auth_controller.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/logoo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: w * .5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: w * 0.35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 7,
                                  offset: const Offset(1, 1),
                                  color: Colors.white.withOpacity(.2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hey There!",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      fontSize: w * .08,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Lets go back to your personal space",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: w * .045,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: w * .08,
                              ),
                              Container(
                                width: w,
                                height: h * .18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 7,
                                          offset: const Offset(1, 1),
                                          color: Colors.grey.withOpacity(.3))
                                    ]),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              SizedBox(
                                height: w * .02,
                              ),
                              Container(
                                width: w,
                                height: h * .18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 7,
                                          offset: const Offset(1, 1),
                                          color: Colors.grey.withOpacity(.2))
                                    ]),
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: const Icon(
                                        Icons.lock_outline_sharp,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AuthController.instance.login(
                                      emailController.text.trim(),
                                      passwordcontroller.text.trim());
                                },
                                child: Container(
                                  width: w * 0.7,
                                  height: h * .15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontFamily: 'JosefinSans',
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * .05,
                              ),
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.grey[500],
                                    fontSize: w * .045,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 7,
                                          offset: const Offset(1, 1),
                                          color: Colors.grey.withOpacity(.2))
                                    ]),
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupPage()));
                                    },
                                    child: Text(
                                      'Create one for Free!!',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: w * .045,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * .1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
