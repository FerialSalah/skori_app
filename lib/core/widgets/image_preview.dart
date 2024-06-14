// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

import 'package:photo_view/photo_view_gallery.dart';
import 'package:skori/core/theme/color_app.dart';
import 'package:skori/core/widgets/main_text.dart';

class GalleryWidget extends StatefulWidget {
  List images;
  int index;
  final PageController pageController;
  GalleryWidget({
    Key? key,
    required this.images,
    this.index = 0,
  }) : pageController = PageController(
          initialPage: index,
        );

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            color: const Color(0xff191919),
          ),
          PhotoViewGallery.builder(
            pageController: widget.pageController,
            itemCount: widget.images.length,
            builder: (context, index) {
              final imageUrl = widget.images[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrl),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
              );
            },
            onPageChanged: (index) => setState(() {
              this.index = index;
            }),
          ),
          Container(
            height: 80.h,
            width: double.infinity,
            color: const Color(0xff191919),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_rounded,
                      color: Colors.grey.shade500,
                      size: 35.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainText(
                    text: "${index + 1} / ${widget.images.length} ",
                    color: ColorApp.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void openGallery(
        {required int index,
        required BuildContext context,
        required List images}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GalleryWidget(
          images: images,
          index: index,
        ),
      ),
    );
