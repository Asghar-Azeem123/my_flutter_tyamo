import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  final IconData iconName;
  final String listTitle;
  DrawerListTile({required this.iconName, required this.listTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Row(
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(iconName,
                    color: Color(0xff00D7CC)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  listTitle,
                  style: GoogleFonts.poppins(
                    color: const Color(0xff2a3d66),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
