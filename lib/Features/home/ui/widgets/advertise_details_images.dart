import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/home/data/models/advertise_model.dart';

class AdvertiseDetailsImages extends StatefulWidget {
  const AdvertiseDetailsImages({super.key, required this.advertiseModel});
  final AdvertiseModel advertiseModel;

  @override
  State<AdvertiseDetailsImages> createState() => _AdvertiseDetailsImagesState();
}

class _AdvertiseDetailsImagesState extends State<AdvertiseDetailsImages> {
  int selectedIndex = 0;
  bool isSelected = false;
  late List<String> images;
  @override
  void initState() {
    images =
        [
              widget.advertiseModel.image_1,
              widget.advertiseModel.image_2,
              widget.advertiseModel.image_3,
              widget.advertiseModel.image_4,
              widget.advertiseModel.image_5,
            ]
            .where(
              (img) => img != null && img.isNotEmpty,
            )
            .map((img) => img!)
            .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        CachedNetworkImage(
          imageUrl: images[selectedIndex],
          imageBuilder: (context, imageProvider) => Container(
            width: MediaQuery.sizeOf(context).width,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomSmallImage(
                imageUrl: images[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
            itemCount: images.length,
          ),
        ),
      ],
    );
  }
}

class CustomSmallImage extends StatelessWidget {
  const CustomSmallImage({
    super.key,
    required this.imageUrl,
    required this.isSelected,
    this.onTap,
  });

  final String imageUrl;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: isSelected
                  ? Border.all(color: Colors.blue, width: 3.w)
                  : Border.all(color: Colors.blueGrey, width: 3.w),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
