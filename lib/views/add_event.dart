import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController _eventController = TextEditingController(
    text: "Outdoor Education Day",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "Abc Nagar Jivan jyoti Dindoli Surat",
  );

  DateTime _selectedDate = DateTime(2025, 1, 12);
  DateTime _lastExamDate = DateTime(2025, 1, 20);

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

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Add Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(title: 'Event'),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(6.0.r),
                  child: TextField(
                    controller: _eventController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2E435B),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22.h),

              title(title: "Address"),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2E435B),
                  ),
                ),
              ),
              SizedBox(height: 22.h),

              title(title: "Date"),
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

              SizedBox(height: 22.h),

              title(title: 'Last date of exam'),
              SizedBox(height: 10.h),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      _formatDate(_lastExamDate),
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
                    onTap: () => _selectDate(context, true),
                    child: Image(image: AssetImage('asset/img/datePicker.png')),
                  ),
                ],
              ),

              SizedBox(height: 22.h),

              title(title: 'Time'),
              SizedBox(height: 18.h),

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
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
                          ),
                          child: Text(
                            'AM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    _isAMStart ? Colors.white : Colors.black54,
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 8),
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
                          ),
                          child: Text(
                            'PM',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    !_isAMEnd ? Colors.white : Colors.black54,
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
              SizedBox(height: 115.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [cancelButton(), SizedBox(width: 12.w), doneButton()],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

Text title({required String title}) {
  return Text(
    title,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xff2E435B),
      ),
    ),
  );
}