import 'dart:io';

import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/features/layouts/home/presentation/widgets/home_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textColor,
        body: Column(
          children: [
            HomeSlider(
              onChange: (value) {
                setState(() {
                  currentSlide = value;
                });
              },
              currentSlide: currentSlide,
            ),
            const SizedBox(height: 100),
            // Spacer(),
            Center(
              child: MaterialButton(
                onPressed: () {
                  pickAndUploadVideo();
                },
                color: Colors.green,
                child: Text(
                  'Pick and open Video',
                  style: AppTextStyle.getMediumTextStyle(color: AppColors.textColor),
                ),
              ),
            ),
          ],
        ),
    );
  }
}



Future<void> pickAndUploadVideo() async {
  // اختيار الفيديو
  final result = await FilePicker.platform.pickFiles(
    type: FileType.video,
  );

  if (result != null && result.files.single.path != null) {
    File videoFile = File(result.files.single.path!);

    // إرسال الفيديو للسيرفر
    // var uri = Uri.parse('http://<YOUR-IP>:8000/upload'); // عدّل هنا
    var uri = Uri.parse('http://192.168.1.127:8000/uploadvideo/'); // عدّل هنا

    var request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // اسم المفتاح اللي السيرفر مستنيه
        videoFile.path,
        filename: basename(videoFile.path),
      ),
    );

    // إرسال الطلب باستخدام client.send
    var client = http.Client();
    try {
      var response = await client.send(request);

      // تحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print("✅ تم رفع الفيديو بنجاح!");
      } else {
        print("❌ فشل رفع الفيديو. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("حدث خطأ أثناء إرسال الطلب: $e");
    } finally {
      // تأكد من إغلاق العميل بعد الانتهاء
      client.close();
    }
  }
}