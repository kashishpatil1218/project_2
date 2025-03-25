import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

import 'add_event.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key});

  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final TextEditingController _feesController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: "12/01/2025",
  );

  TimeOfDay _startTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 8, minute: 0);
  bool _isAMStart = true;
  bool _isAMEnd = true;

  Future<void> _selectDate(BuildContext context, bool isLastExam) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isLastExam ? _lastExamDate : _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF2D3B54)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isLastExam) {
          _lastExamDate = picked;
        } else {
          _selectedDate = picked;
        }
      });
    }
  }

  DateTime _selectedDate = DateTime(2025, 1, 12);
  DateTime _lastExamDate = DateTime(2025, 1, 20);

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Add Details'),
      body: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(title: 'Fees'),
          
              SizedBox(height: 5.h),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(4.0.r),
                  child: TextField(
                    controller: _feesController,
                    decoration: InputDecoration(
                      hintText: "Enter the amount",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB1B1B1),
                        ),
                      ),
                      suffixIcon: Image(
                        image: AssetImage('asset/img/Category.png'),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              title(title: 'Discount'),
              SizedBox(height: 5.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(4.0.r),
                  child: TextField(
                    controller: _discountController,
                    decoration: InputDecoration(
                      hintText: "Enter the discount",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB1B1B1),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              title(title: 'Date'),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _formatDate(_selectedDate),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2E435B),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: Image(image: AssetImage('asset/img/datePicker.png')),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              title(title: 'Time'),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 68.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _startTime.hourOfPeriod.toString().padLeft(2, '0') +
                          ':' +
                          _startTime.minute.toString().padLeft(2, '0'),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAMStart = true;
                          });
                        },
                        child: Container(
                          width: 35.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                _isAMStart
                                    ? const Color(0xFF2D3B54)
                                    : Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'AM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: _isAMStart ? Colors.white : Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAMStart = false;
                          });
                        },
                        child: Container(
                          width: 35.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                !_isAMStart
                                    ? const Color(0xFF2D3B54)
                                    : Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'PM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    !_isAMStart ? Colors.white : Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 14.w),
                  Text(
                    'To',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2E435B),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 68.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _endTime.hourOfPeriod.toString().padLeft(2, '0') +
                          ':' +
                          _endTime.minute.toString().padLeft(2, '0'),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAMEnd = true;
                          });
                        },
                        child: Container(
                          width: 35.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                _isAMEnd
                                    ? const Color(0xFF2D3B54)
                                    : Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'AM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: _isAMEnd ? Colors.white : Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAMEnd = false;
                          });
                        },
                        child: Container(
                          width: 35.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                !_isAMEnd
                                    ? const Color(0xFF2D3B54)
                                    : Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'PM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: !_isAMEnd ? Colors.white : Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 200.h),
          
              Align(alignment: Alignment.bottomRight, child: doneButton()),
            ],
          ),
        ),
      ),
    );
  }
}
