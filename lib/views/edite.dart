import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/views/add_event.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class Edite extends StatefulWidget {
  @override
  _EditeState createState() => _EditeState();
}

class _EditeState extends State<Edite> {
  String selectedSubject = 'Science';
  List<String> chapters = ['Knowing Our Number'];
  TextEditingController chapterController = TextEditingController();

  void addChapter() {
    if (chapterController.text.isNotEmpty) {
      setState(() {
        chapters.add(chapterController.text);
        chapterController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Add details'),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(title: 'Subject name'),
            SizedBox(height: 8.h),
            Card(
              color: Colors.white,
              child: DropdownButtonFormField<String>(
                value: selectedSubject,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
                items:
                    ['Science', 'Math', 'English']
                        .map(
                          (subject) => DropdownMenuItem(
                            value: subject,
                            child: Text(subject),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedSubject = value;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 14.h),
            title(title: 'Chapters'),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: TextField(
                        controller: chapterController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter chapter name",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.r),
                ElevatedButton(onPressed: addChapter, child: Icon(Icons.add)),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: chapters.length,
                itemBuilder:
                    (context, index) => ListTile(title: Text(chapters[index])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancelButton(), SizedBox(width: 15.w), doneButton()],
            ),
          ],
        ),
      ),
    );
  }
}
