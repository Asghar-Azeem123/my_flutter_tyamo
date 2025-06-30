import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_tyamo/Views/Auth/login.dart';
import 'package:my_flutter_tyamo/Views/Widgets/Auth/auth_heading.dart';
import 'package:my_flutter_tyamo/Views/Widgets/Auth/auth_text_field.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatelessWidget {
  final RoundedLoadingButtonController _registerbtncontroller =
      RoundedLoadingButtonController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tyamo",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff000221),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // AuthHeading("hello", "how are you", 12, 22),
            AuthHeading(
              mainText: "Sign Up with Tyamo ",
              subText: "& continue wining\n crypto Traders ",
              logo: "images/tym.jpg",
              fontsize: height * 0.05,
              logosize: height * 0.05,
            ),
            const SizedBox(height: 50),
            AuthTextField(
              labelText: "Email",
              icon: Icons.alternate_email,
              size: height * 0.05,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            SizedBox(height: height * .02),
            AuthTextField(
              labelText: "Password",
              icon: Icons.password,
              size: height * 0.05,
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
            SizedBox(height: height * .02),
            AuthTextField(
              labelText: "Confirmed Password",
              icon: Icons.lock_reset,
              size: height * 0.05,
              keyboardType: TextInputType.text,
              obscureText: false,
            ),

            SizedBox(height: height * .02),
            Hero(
              tag: "Auth",
              child: RoundedLoadingButton(
                width: width,
                borderRadius: 10,
                controller: _registerbtncontroller,
                color: const Color(0xff00c1AA),
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .02),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "By Registering you agree to terms and conditions",
                style: GoogleFonts.poppins(
                  color: const Color(0xff00c1AA),
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.05,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: .024),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Registered",
                  style: GoogleFonts.poppins(
                    color: const Color(0xff808080),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.05,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    " Sign In ",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2f76EA),
                      fontWeight: FontWeight.w700,
                      fontSize: height * 0.05,
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
