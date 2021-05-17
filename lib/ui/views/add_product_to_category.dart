import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/product.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:provider/provider.dart';

class AddProductToCategory extends StatefulWidget {
  @override
  _AddProductToCategoryState createState() => _AddProductToCategoryState();
}

class _AddProductToCategoryState extends State<AddProductToCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      CupertinoIcons.chevron_back,
                      color: Color(0xFF56606A),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add Product to Category",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Color(0xFF56606A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose Product",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFF56606A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: context
                      .read<DatabaseService>()
                      .getProducts('ibrahimnd2000@gmail.com'),
                  builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButton<String>(
                        hint: Text("Product"),
                        underline: Container(),
                        isExpanded: true,
                        items: snapshot.data.map((Product value) {
                          return new DropdownMenuItem<String>(
                            value: value.name,
                            child: new Text(value.name),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Category",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFF56606A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  hint: Text("Category"),
                  underline: Container(),
                  isExpanded: true,
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
              Spacer(),
              Container(
                height: 70,
                width: .95.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(colors: [
                      Color(0xFF47C789),
                      Color(0xFF32B5AF),
                    ])),
                child: Center(
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
