import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: "Questions"),
      body: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: Column(
          children: [
            QuestionCard(
              question: "1. What is Computer",
              options: [
                "A type of television",
                "An electronic device that processes data",
                "A machine for washing clothes",
                "A musical instrument",
              ],
            ),
            SizedBox(height: 16.h),
            QuestionCard(question: "How many types of data type"),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancelButton(), SizedBox(width: 13.w), doneButton()],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  final List<String>? options;

  const QuestionCard({super.key, required this.question, this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            question,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff2E435B),
              ),
            ),
          ),
          if (options != null)
            ...options!.map((option) {
              return Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    option,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2E435B),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
        ],
      ),
    );
  }
}
