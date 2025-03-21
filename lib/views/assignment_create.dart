// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project_2/views/components/app_bar_component.dart';
// import 'package:project_2/views/components/cancle_button_done_button.dart';
//
// class AssignmentCreate extends StatefulWidget {
//   @override
//   _AssignmentCreateState createState() => _AssignmentCreateState();
// }
//
// class _AssignmentCreateState extends State<AssignmentCreate> {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController subjectController = TextEditingController(
//     text: "Science",
//   );
//   TextEditingController assignmentController = TextEditingController(
//     text: "Chapter 1 to 3",
//   );
//   TextEditingController noticeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarr(title: 'Add Details'),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildLabel("Date"),
//             buildTextField(
//               controller: dateController,
//               hintText: "Select Date",
//               readOnly: true,
//               onTap: _selectDate,
//             ),
//             buildLabel("Subject"),
//             buildTextField(controller: subjectController, readOnly: true),
//             buildLabel("Assignment"),
//             buildTextField(
//               controller: assignmentController,
//               readOnly: true,
//               suffixIcon: Image(image: AssetImage('asset/img/attach.png'))
//
//             ),
//             buildLabel("Notice"),
//             buildTextField(
//               controller: noticeController,
//               hintText: "Enter here..",
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [cancelButton(), SizedBox(width: 12), doneButton()],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12, bottom: 6),
//       child: Text(
//         text,
//         style: GoogleFonts.poppins(
//           textStyle: TextStyle(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//             color: Color(0xff2E435B),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField({
//     required TextEditingController controller,
//     String? hintText,
//     bool readOnly = false,
//     VoidCallback? onTap,
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       readOnly: readOnly,
//       onTap: onTap,
//       decoration: InputDecoration(
//         hintText: hintText,
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       ),
//     );
//   }
//
//   Future<void> _selectDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         dateController.text =
//             "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//       });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class AssignmentCreate extends StatefulWidget {
  @override
  _AssignmentCreateState createState() => _AssignmentCreateState();
}

class _AssignmentCreateState extends State<AssignmentCreate> {
  TextEditingController dateController = TextEditingController();
  TextEditingController subjectController = TextEditingController(
    text: "Science",
  );
  TextEditingController assignmentController = TextEditingController(
    text: "Chapter 1 to 3",
  );
  TextEditingController noticeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarr(title: 'Add Details'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel("Date"),
            buildTextField(
              controller: dateController,
              hintText: "Select Date",
              readOnly: true,
              onTap: _selectDate,
            ),
            buildLabel("Subject"),
            buildTextField(controller: subjectController, readOnly: true),
            buildLabel("Assignment"),
            buildTextField(
              controller: assignmentController,
              readOnly: true,
              suffixIcon: GestureDetector(
                onTap: () => _showAttachmentDialog(context),
                // Open dialog on tap
                child: Padding(
                  padding: EdgeInsets.all(12), // Padding for better tap area
                  child: Image.asset('asset/img/attach.png'),
                ),
              ),
            ),
            buildLabel("Notice"),
            buildTextField(
              controller: noticeController,
              hintText: "Enter here..",
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancelButton(), SizedBox(width: 12), doneButton()],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff2E435B),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    String? hintText,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void _showAttachmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 22.w,
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildAttachmentOption(
                Icons.insert_drive_file,
                "Document",
                Colors.purpleAccent,
              ),
              buildAttachmentOption(Icons.camera_alt, "Camera", Colors.pink),
              buildAttachmentOption(Icons.image, "Gallery", Colors.blue),
              buildAttachmentOption(Icons.contacts, "Contact", Colors.cyan),
            ],
          ),

        );
      },
    );
  }

  Widget buildAttachmentOption(IconData icon, String text, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 32),
      title: Text(text, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context); // Close the dialog
      },
    );
  }
}
