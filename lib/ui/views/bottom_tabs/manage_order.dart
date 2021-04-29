import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/sales_data.dart';
import 'package:persotrainer/ui/widgets/persotrainer_order.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ManageOrder extends StatefulWidget {
  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, 25, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      items: [
        PopupMenuItem<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Active',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  '(3)',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF55D088), fontWeight: FontWeight.w600),
                )
              ],
            ),
            value: 'Doge'),
        PopupMenuItem<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Completed',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  '(3)',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF55D088), fontWeight: FontWeight.w600),
                )
              ],
            ),
            value: 'Doge'),
        PopupMenuItem<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Late Deliver',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  '(3)',
                  style: GoogleFonts.poppins(
                      color: Color(0xFFFEAE25), fontWeight: FontWeight.w600),
                )
              ],
            ),
            value: 'Doge'),
        PopupMenuItem<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cancel Order',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  '(3)',
                  style: GoogleFonts.poppins(
                      color: Color(0xFFFE2727), fontWeight: FontWeight.w600),
                )
              ],
            ),
            value: 'Doge'),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
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
                    Text(
                      "Manage Orders",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) =>
                          _showPopupMenu(details.globalPosition),
                      child: Image.asset(
                        'assets/images/icons/filter.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Satistics",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 280,
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$ 109.564",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Color(0xFF53CF86),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Total Earnings",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$ 9.564",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Earnings in December",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            child: SfCartesianChart(
                                // Initialize category axis
                                primaryXAxis: CategoryAxis(),
                                enableAxisAnimation: false,
                                plotAreaBorderColor: Colors.white,
                                tooltipBehavior: TooltipBehavior(enable: true),
                                plotAreaBackgroundColor: Colors.white,
                                palette: [
                                  Color(0xFFFF007C),
                                ],
                                series: <LineSeries<SalesData, String>>[
                                  LineSeries<SalesData, String>(
                                    width: 5,
                                    animationDuration: 0,
                                    // Bind data source
                                    dataSource: <SalesData>[
                                      SalesData(20, 'Jan'),
                                      SalesData(60, 'Feb'),
                                      SalesData(20, 'Mar'),
                                      SalesData(20, 'Apr'),
                                      SalesData(60, 'May'),
                                      SalesData(20, 'Jun'),
                                      SalesData(25, 'Jul'),
                                      SalesData(20, 'Aug'),
                                      SalesData(80, 'Sep'),
                                      SalesData(75, 'Oct'),
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.month,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.amount,
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Orders",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => PersoTrainerOrder(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
