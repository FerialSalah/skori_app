import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skori/core/widgets/loader.dart';
import '../../theme/color_app.dart';

class CachedImageNetwork extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  const CachedImageNetwork({Key? key, required this.image,  this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: image,
      width: double.infinity,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: Colors.transparent,
          image: DecorationImage(
            image: imageProvider,
              fit: fit??BoxFit.contain
          ),
        ),
      ),
      placeholder: (context, url) =>  Center(
        child: SizedBox(
            width: 30, height: 30, child: ColorLoader()),
      ),
      errorWidget: (context, url, error) => Center(
        child: SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              Icons.more_horiz,
              color: ColorApp.red,
            )),
      ),
    );
  }
}
