import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const HomeSlider(
      {super.key, required this.onChange, required this.currentSlide});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  List<String> imageUrls = [
    'assets/images/children1.jpeg',
    'assets/images/children2.jpeg',
    'assets/images/children3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(url),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          // Positioned.fill(
          //   bottom: 0,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: List.generate(
          //         3,
          //         (index) => AnimatedContainer(
          //           duration: const Duration(milliseconds: 100),
          //           width: widget.currentSlide == index ? 15 : 8,
          //           height: 8,
          //           margin: const EdgeInsets.only(right: 3),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: widget.currentSlide == index
          //                 ? Colors.black
          //                 : Colors.transparent,
          //             border: Border.all(color: Colors.black),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
