import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdvertiseImagePicker extends StatefulWidget {
  final Function(List<File>) onImagesSelected;

  const AdvertiseImagePicker({super.key, required this.onImagesSelected});

  @override
  State<AdvertiseImagePicker> createState() => _AdvertiseImagePickerState();
}

class _AdvertiseImagePickerState extends State<AdvertiseImagePicker> {
  final ImagePicker _picker = ImagePicker();
  List<File> images = [];

  Future<void> _pickImages() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      imageQuality: 80,
    );

    if (pickedFiles != null) {
      setState(() {
        images.addAll(pickedFiles.map((e) => File(e.path)));
      });

      widget.onImagesSelected(images);
    }
  }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
    widget.onImagesSelected(images);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add_photo_alternate),
          label: const Text('اضافة صور'),
          onPressed: _pickImages,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(images.length, (index) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    images[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
