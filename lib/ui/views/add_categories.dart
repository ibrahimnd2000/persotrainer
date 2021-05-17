import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/category.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/views/create_category.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
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
                    "Add Category",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Color(0xFF56606A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateCategory(),
                        )),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                      ),
                    ]),
                child: Row(
                  children: [
                    Text(
                      "Category Title",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey.shade200,
                    ),
                    Spacer(),
                    Text(
                      "No. of Products",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: context
                        .read<DatabaseService>()
                        .loadCategories('ibrahimnd2000@gmail.com'),
                    builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                      if (!snapshot.hasData) return Container();
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Category category = snapshot.data[index];
                            return Container(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      width: .45.sw,
                                      child: Text(
                                        category.title,
                                        style:
                                            GoogleFonts.poppins(fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.grey.shade200,
                                    ),
                                    Spacer(),
                                    Text(
                                      "0",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
