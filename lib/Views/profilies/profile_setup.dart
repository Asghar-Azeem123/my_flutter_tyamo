import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_flutter_tyamo/Views/invitations/invite_friend.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../Widgets/Auth/auth_text_field.dart';

class ProfileSetup extends StatefulWidget {
  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final RoundedLoadingButtonController profilebtncontroller =
      RoundedLoadingButtonController();

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const SizedBox(
          height: 100,
          width: 100,
          child: Image(image: AssetImage("images/tym.jpg")),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      // backgroundColor: Color(0xff000221),

      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff000221),
            ),
            child: Text(
              "profile Setup",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const CircleAvatar(
            backgroundColor: Colors.cyan,
            radius: 50,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AuthTextField(
                labelText: " Your Name ",
                icon: Icons.face,
                size: 16,
                keyboardType: TextInputType.text,
                obscureText: false),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AuthTextField(
                labelText: " Your userName ",
                icon: Icons.alternate_email,
                size: 16,
                keyboardType: TextInputType.text,
                obscureText: false),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: isMale ? Colors.cyan : Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 9.0),
                          blurRadius: 30),
                    ],
                  ),
                  child: const Icon(Icons.male, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: !isMale ? Colors.purple : Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 9.0),
                          blurRadius: 30),
                    ],
                  ),
                  child: const Icon(Icons.male, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: RoundedLoadingButton(
                borderRadius: 10,
                controller: profilebtncontroller,
                color: const Color(0xff00c1AA),
                onPressed: () {
                  Timer(const Duration(seconds: 3), () {
                    profilebtncontroller.success();
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const InviteFriend(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Next",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                )),
          ),
        ],
      ),
    );
  }
}
