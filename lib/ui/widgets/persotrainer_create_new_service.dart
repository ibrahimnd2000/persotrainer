import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/ui/views/add_service.dart';
import 'package:persotrainer/ui/widgets/persotrainer_button.dart';

class PersoTrainerCreateNewService extends StatefulWidget {
  @override
  _PersoTrainerCreateNewServiceState createState() =>
      _PersoTrainerCreateNewServiceState();
}

class _PersoTrainerCreateNewServiceState
    extends State<PersoTrainerCreateNewService> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 280,
        width: .95.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(80),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Center(
                  child: ShaderMask(
                    child: Image(
                      image: AssetImage(
                          'assets/images/icons/customer-support.png'),
                      height: 80,
                      width: 80,
                    ),
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF54C4C1), Color(0xFF6BD397)],
                        stops: [
                          0.0,
                          1.0,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                  ),
                ),
              ),
            ),
            Container(
                width: 280,
                child: PersoTrainerButton('CREATE NEW SERVICE', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddService()));
                })),
          ],
        ),
      ),
    );
  }
}
