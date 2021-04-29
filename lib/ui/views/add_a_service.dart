import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/widgets/persotrainer_create_new_product.dart';
import 'package:persotrainer/ui/widgets/persotrainer_create_new_service.dart';

class AddAService extends StatefulWidget {
  @override
  _AddAServiceState createState() => _AddAServiceState();
}

class _AddAServiceState extends State<AddAService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                  )
                ],
              ),
              height: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add Service or Product",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: PersoTrainerCreateNewService()),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: PersoTrainerCreateNewProduct()),
          ],
        ),
      )),
    );
  }
}
