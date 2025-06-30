import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_tyamo/Views/Auth/register.dart';
import 'package:my_flutter_tyamo/Views/Widgets/Auth/auth_heading.dart';
import 'package:my_flutter_tyamo/Views/Widgets/Auth/auth_text_field.dart';
import 'package:my_flutter_tyamo/Views/profilies/profile_setup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RoundedLoadingButtonController _btncontroller =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tyamo",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff000221),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            AuthHeading(
              mainText: "Sign into with Tyamo ",
              subText: "& continue wining\n crypto Traders ",
              logo: "images/tym.jpg",
              fontsize: height * 0.02,
              logosize: height * 0.05,
            ),
            SizedBox(height: height * .15),
            AuthTextField(
              labelText: "Email",
              icon: Icons.alternate_email,
              size: height * 0.02,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            SizedBox(height: height * .1),
            AuthTextField(
              labelText: "Password",
              icon: Icons.password,
              size: height * 0.02,
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            SizedBox(height: height * .1),
            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  borderRadius: 10,
                  controller: _btncontroller,
                  color: const Color(0xff00c1AA),
                  onPressed: () {
                    Timer(const Duration(seconds: 2), () {
                      _btncontroller.success();
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ProfileSetup(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .1),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   PageTransition(
                //     type: PageTransitionType.fade,
                //     child: ForgotPassword(),
                //   ),
                // );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password ",
                  style: GoogleFonts.poppins(
                    color: const Color(0xffc1272D),
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    color: const Color(0xff5A5B5B),
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up ",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2F76EA),
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
