import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';

import 'components/FBA.dart';

class FeesDetailsScreen extends StatefulWidget {
  const FeesDetailsScreen({super.key});

  @override
  _FeesDetailsScreenState createState() => _FeesDetailsScreenState();
}

class _FeesDetailsScreenState extends State<FeesDetailsScreen> {
  Map<String, bool> expandedSections = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Fees Details'),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeesSummaryItem(title: "Amount", value: "45000"),
                  FeesSummaryItem(title: "Discount", value: "00"),
                  FeesSummaryItem(title: "Fine", value: "00"),
                  FeesSummaryItem(title: "Paid", value: "35000"),
                  FeesSummaryItem(title: "Unpaid", value: "10000"),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView(
                children: [
                  buildFeesItem("January", "Paid", Colors.green),
                  buildFeesItem(
                    "February",
                    "Paid",
                    Colors.green,
                    isExpandable: true,
                  ),
                  buildFeesItem("March", "Paid", Colors.green),
                  buildFeesItem("April", "Unpaid", Colors.red),
                  buildFeesItem("May", "Paid", Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
     floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildFeesItem(
    String month,
    String status,
    Color statusColor, {
    bool isExpandable = false,
  }) {
    return Card(
      elevation: 3,
      child: ExpansionTile(
        initiallyExpanded: expandedSections[month] ?? false,
        onExpansionChanged: (expanded) {
          setState(() {
            expandedSections[month] = expanded;
          });
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              month,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff45586A),
                ),
              ),
            ),
            Text(
              status,
              style:GoogleFonts.poppins(
                textStyle:  TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              )
            ),
          ],
        ),
        children:
            isExpandable
                ? [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        buildDetailRow("Monthly fees", "3000"),
                        buildDetailRow("Admission fees", "750"),
                        const Divider(),
                        buildDetailRow("Total fees", "3750", isBold: true),
                      ],
                    ),
                  ),
                ]
                : [],
      ),
    );
  }

  Widget buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class FeesSummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const FeesSummaryItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff45586A),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          value,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xffACA9A9A9),
            ),
          ),
        ),
      ],
    );
  }
}
