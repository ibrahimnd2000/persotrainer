import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/views/cart_detail_page.dart';

class PersoTrainerProductItem extends StatefulWidget {
  String chatRoomId;
  PersoTrainerProductItem({this.chatRoomId});
  @override
  _PersoTrainerProductItemState createState() =>
      _PersoTrainerProductItemState();
}

class _PersoTrainerProductItemState extends State<PersoTrainerProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CartDetailPage(
                    chatRoomId: widget.chatRoomId,
                  ))),
      child: Container(
        width: .5.sw,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            Row(
              children: [
                Text(
                  "How to be best runner!",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "14.99\$",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFB3B3B3),
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
