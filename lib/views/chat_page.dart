import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Card(
          color: Colors.white,
          child: Row(
            children: [
              Image.asset(
                'asset/img/CHAT_ARROW.png',
                height: 42.h,
                width: 42.w,
              ),
              const CircleAvatar(
                // TODO Replace your profile here
                backgroundImage: NetworkImage("https://via.placeholder.com/50"),
              ),
              SizedBox(width: 8.w),
              Text(
                "Hamda Said",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(width: 60.w),
              Image.asset('asset/img/CHAT_VIDEO.png'),
              SizedBox(width: 14.w),
              Image.asset('asset/img/CHATcALL.png'),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Image.asset('asset/img/CHATLINK.png'),
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child:  TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.copy, color: Colors.grey),
                        hintText: "Write your message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 5.w,),
                Image.asset('asset/img/CHATcamera 01.png'),
                SizedBox(width: 15.w),
                Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: Image.asset('asset/img/CAHTMIC.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}