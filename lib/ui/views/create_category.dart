import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/category.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:provider/provider.dart';

class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  bool isCheck = false;
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _tags = TextEditingController();

  void createCategory({String title, String desc, List<String> tags}) {
    Category category =
        Category(title: title, desc: desc, tags: isCheck ? tags : []);
    context
        .read<DatabaseService>()
        .addCategory(category, 'ibrahimnd2000@gmail.com');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Category created!")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: SingleChildScrollView(
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
                      "Create Category",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF56606A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title:",
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          controller: _title,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            hintText: "Specify title for your category.",
                            hintStyle: GoogleFonts.poppins(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Description:",
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          controller: _desc,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            hintText:
                                "Brief category description (max. 10 lines)",
                            hintStyle: GoogleFonts.poppins(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (bool value) {
                                setState(
                                  () {
                                    isCheck = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: .7.sw,
                              child: Text(
                                "Include products with specified tags in this category",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: isCheck,
                          child: Column(
                            children: [
                              Text(
                                "Tags:",
                                style: GoogleFonts.poppins(fontSize: 24),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextField(
                                controller: _tags,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: "Add Tags (Separated by comma)",
                                  hintStyle: GoogleFonts.poppins(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => createCategory(
                      title: _title.text,
                      desc: _desc.text,
                      tags: _tags.text.split(',')),
                  child: Container(
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
                        "Create",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
