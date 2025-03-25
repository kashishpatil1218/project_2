import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({super.key});

  @override
  _AddExamScreenState createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final TextEditingController _monthController = TextEditingController(
    text: "January",
  );
  final TextEditingController _headingController = TextEditingController(
    text: "Round test -1",
  );
  final TextEditingController _dateController = TextEditingController(
    text: "12/01/2025",
  );
  final TextEditingController _lastDateController = TextEditingController(
    text: "20/01/2025",
  );

  String selectedSubject = "Science";

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: "Add Exam"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Month", _monthController, false),
            _buildTextField("Heading", _headingController, false),
            _buildDatePickerField("Date", _dateController),
            _buildDatePickerField("Last date of exam", _lastDateController),
            _buildSubjectField(),
            SizedBox(height: 150.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancelButton(), SizedBox(width: 15.w), doneButton()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool isEditable,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff2E435B),
            ),
          ),
        ),
        SizedBox(height: 4),
        Card(
          color: Colors.white,
          child: TextField(
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff070707),
              ),
            ),
            controller: controller,
            enabled: isEditable,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildDatePickerField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff2E435B),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Card(
          color: Colors.white,
          child: TextField(
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff070707),
              ),
            ),
            controller: controller,
            readOnly: true,
            onTap: () => _selectDate(context, controller),
            decoration: InputDecoration(
              suffix: Image(image: AssetImage('asset/img/datePicker.png')),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSubjectField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Subject",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff2E435B),
            ),
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedSubject,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff070707),
                        ),
                      ),
                    ),
                    Icon(Icons.access_time, color: Colors.grey[800]),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.add, color: Colors.grey[800], size: 30),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
