import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/add_event.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class CreateTableScreen extends StatefulWidget {
  const CreateTableScreen({super.key});

  @override
  _CreateTableScreenState createState() => _CreateTableScreenState();
}

class _CreateTableScreenState extends State<CreateTableScreen> {
  final TextEditingController _titleController = TextEditingController(
    text: "Round Test - 1",
  );
  final TextEditingController _subjectController = TextEditingController(
    text: "Science",
  );
  final TextEditingController _marksController = TextEditingController(
    text: "100",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Create Table'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(title: 'Title'),
              const SizedBox(height: 5),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff070707),
                      ),
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 13.h),
              title(title: "Subject"),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: TextField(
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff070707),
                          ),
                        ),
                        controller: _subjectController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.add, color: Colors.grey[800], size: 25),
                ],
              ),
              SizedBox(height: 13.h),
              title(title: 'Marks'),
              SizedBox(height: 5.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff070707),
                      ),
                    ),
                    controller: _marksController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 280.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [cancelButton(), SizedBox(width: 15.w), doneButton()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
