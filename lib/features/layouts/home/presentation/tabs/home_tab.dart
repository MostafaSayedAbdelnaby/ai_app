import 'dart:io';
import 'package:ai_app/core/routes/app_routes.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
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
  String webSocketData = '';
  // final AudioPlayer audioPlayer = AudioPlayer();

  // Future<void> showWebSocketDialog(BuildContext context) async {
  //   if (webSocketData.isNotEmpty) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("WebSocket Data"),
  //           content: Text(webSocketData),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

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
          Center(
            child: MaterialButton(
              onPressed: () async {
                await pickAndUploadVideo();
                print("Pick and open Video **************");
                Navigator.pushNamed(context, AppRoutes.onClick);
              },

              // onPressed: () async {
              //   bool isSuccess = await pickAndUploadVideo();
              //   if (isSuccess) {
              //     await streamWebSocket();
              //   }
              // },
              color: Colors.green,
              child: Text(
                'Pick and open Video',
                style:
                    AppTextStyle.getMediumTextStyle(color: AppColors.textColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // IconButton(
          //   onPressed: () {
          //     showWebSocketDialog(context);
          //   },
          //   icon: const Icon(
          //     Iconsax.notification,
          //     size: 35,
          //     color: AppColors.blueColor,
          //   ),
          // ),
        ],
      ),
    );
  }

  // ***
  // Future<void> streamWebSocket() async {
  //   final wsUrl = Uri.parse('ws://192.168.1.127:8000/ws');
  //   final channel = WebSocketChannel.connect(wsUrl);
  //
  //   channel.stream.listen((message) {
  //     setState(() {
  //       webSocketData = message; // Update the state with new data
  //     });
  //   });
  // }

  // Future<void> streamWebSocket() async {
  //   final wsUrl = Uri.parse('ws://192.168.1.127:8000/ws');
  //   final channel = WebSocketChannel.connect(wsUrl);
  //
  //   channel.stream.listen((message) {
  //     setState(() {
  //       webSocketData = message;
  //     });
  //     if (message == "Ahmed Mohamed") {
  //       playSound();
  //     }
  //   });
  // }

  // Future<void> playSound() async {
  //   await audioPlayer.play(AssetSource('sound/0004218.mp3'));
  // }
}

Future<Stream> stream() async {
  final wsUrl = Uri.parse('ws://192.168.1.127:8000/ws');
  final channel = WebSocketChannel.connect(wsUrl);
  await channel.ready;
  //  channel.stream.listen((message) {
  //   print("***************************");
  //   print(message);  // ********
  //   print("##########################");
  //
  //   channel.sink.add('received!');
  //   channel.sink.close(status.goingAway);
  // });
  return channel.stream;
}

Future<void> pickAndUploadVideo() async {
  // اختيار الفيديو
  final result = await FilePicker.platform.pickFiles(type: FileType.video);

  if (result != null && result.files.single.path != null) {
    File videoFile = File(result.files.single.path!);

    // إرسال الفيديو للسيرفر
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

// Future<bool> pickAndUploadVideo() async {
//   final result = await FilePicker.platform.pickFiles(type: FileType.video);
//
//   if (result != null && result.files.single.path != null) {
//     File videoFile = File(result.files.single.path!);
//     var uri = Uri.parse('http://192.168.1.127:8000/uploadvideo/');
//
//     var request = http.MultipartRequest('POST', uri);
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'file',
//         videoFile.path,
//         filename: basename(videoFile.path),
//       ),
//     );
//
//     var client = http.Client();
//     try {
//       var response = await client.send(request);
//       return response.statusCode == 200;
//     } catch (e) {
//       print("Error: $e");
//       return false;
//     } finally {
//       client.close();
//     }
//   }
//   return false;
// }
