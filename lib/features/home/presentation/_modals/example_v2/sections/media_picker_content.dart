import 'package:flutter/material.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/widgets/option_card.dart';

/// Section content for media picker sheet
class MediaPickerContent extends StatelessWidget {
  const MediaPickerContent({required this.onSelect, super.key});

  final void Function(String value) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OptionCard(
          icon: Icons.photo_library_rounded,
          title: 'Choose from Gallery',
          subtitle: 'Select an existing photo',
          iconColor: Colors.purple,
          onTap: () => onSelect('gallery'),
        ),
        OptionCard(
          icon: Icons.camera_alt_rounded,
          title: 'Take Photo',
          subtitle: 'Use camera to take new photo',
          iconColor: Colors.blue,
          onTap: () => onSelect('camera'),
        ),
        OptionCard(
          icon: Icons.insert_drive_file_rounded,
          title: 'Choose File',
          subtitle: 'Select a document',
          iconColor: Colors.orange,
          onTap: () => onSelect('file'),
        ),
      ],
    );
  }
}
