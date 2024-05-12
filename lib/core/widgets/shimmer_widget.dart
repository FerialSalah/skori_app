import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skori/core/theme/color_app.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context,index)=>Shimmer.fromColors(
            baseColor:   ColorApp.hintGray,
            highlightColor:   ColorApp.lightGray,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorApp.lightGray,
              ),
              child:Row(
                children: [
                  Shimmer.fromColors(
                      baseColor:   ColorApp.hintGray,
                      highlightColor:   ColorApp.hintGray,child: CircleAvatar(backgroundColor: ColorApp.lightGray,maxRadius: 30,)),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor:   ColorApp.hintGray,
                        highlightColor:   ColorApp.hintGray,
                        child: Container(
                            height: 30,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorApp.lightGray,)),
                      ),
                      SizedBox(height: 15,),
                      Shimmer.fromColors(
                        baseColor:   ColorApp.hintGray,
                        highlightColor:   ColorApp.hintGray,
                        child: Container(
                            height: 30,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorApp.lightGray,)),
                      ),

                    ],
                  )

                ],
              ) ,
            )
        ),
        separatorBuilder: (_,c)=>SizedBox(height: 10,),
        itemCount: 10);
  }
}
