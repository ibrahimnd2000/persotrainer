import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persotrainer/main.dart';
import 'package:persotrainer/models/post.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/widgets/persotrainer_button.dart';
import 'package:persotrainer/ui/widgets/persotrainer_service_textfield.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  File _video;
  Uint8List uint8list;
  final picker = ImagePicker();
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController serviceDescController = TextEditingController();
  final TextEditingController serviceTagsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
      } else {
        print("No video selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
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
                      "Add Service",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                height: 580,
                width: .95.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MUHAMMAD IBRAHIM',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "iamdavid@gmail.com",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        await getVideo();
                        uint8list = await VideoThumbnail.thumbnailData(
                          video: _video.path,
                          imageFormat: ImageFormat.JPEG,
                          quality: 85,
                        );
                        setState(() {});
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 200,
                            height: 120,
                            color: Colors.grey.shade100,
                            child: Center(
                              child: uint8list != null
                                  ? Image.memory(
                                      uint8list,
                                    )
                                  : Image.asset(
                                      'assets/images/icons/attach.png',
                                      color: Colors.grey.shade300,
                                      height: 70,
                                      width: 70,
                                    ),
                            ),
                          ),
                          Positioned(
                            right: 60,
                            bottom: 25,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF54C4C1),
                                    Color(0xFF6BD397)
                                  ],
                                  stops: [
                                    0.0,
                                    1.0,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Icon(
                                CupertinoIcons.add,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PersoTrainerServiceTextField(
                      hintText: 'Service Name',
                      asset: 'draw',
                      controller: serviceNameController,
                    ),
                    PersoTrainerServiceTextField(
                      hintText: 'Service Description',
                      asset: 'info',
                      controller: serviceDescController,
                    ),
                    PersoTrainerServiceTextField(
                      hintText: 'Service Tags',
                      asset: 'tag',
                      controller: serviceTagsController,
                    ),
                    PersoTrainerServiceTextField(
                      hintText: 'Price',
                      asset: 'dollar-symbol',
                      controller: priceController,
                    ),
                    Spacer(),
                    Container(
                        width: 280,
                        child: PersoTrainerButton('SUBMIT', () {
                          context.read<DatabaseService>().addPost(Post(
                                title: serviceNameController.text,
                                description: serviceDescController.text,
                                isLiked: false,
                                comments: 0,
                                likes: 0,
                                shares: 0,
                                tags: serviceTagsController.text.split(','),
                                postedBy: 'Muhammad Ibrahim',
                                timestamp: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                              ));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AuthenticationWrapper()),
                              ModalRoute.withName('/'));
                        })),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
