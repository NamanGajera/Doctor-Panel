import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HelperFunctions {
  static final ImagePicker _picker = ImagePicker();

  static Future<MediaPickerResponse?> pickMedia({
    required BuildContext context,
    MediaType mediaType = MediaType.image,
    PickerSource source = PickerSource.both,
    bool allowMultiple = false,
    int imageQuality = 80,
    Duration maxVideoDuration = const Duration(minutes: 10),
    String bottomSheetTitle = 'Select Media',
    String cameraLabel = 'Camera',
    String galleryLabel = 'Gallery',
    String videoLabel = 'Video',
    String multipleImagesLabel = 'Multiple Images',
    Widget? bottomSheetIcon,
    BorderRadius? bottomSheetBorderRadius,
    Color? bottomSheetBackgroundColor,
    TextStyle? optionTextStyle,
    EdgeInsets bottomSheetPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  }) async {
    if (source != PickerSource.both) {
      final ImageSource imageSource = source == PickerSource.camera ? ImageSource.camera : ImageSource.gallery;

      if (mediaType == MediaType.image && allowMultiple && source == PickerSource.gallery) {
        final List<XFile> pickedFiles = await _picker.pickMultiImage(imageQuality: imageQuality);
        if (pickedFiles.isNotEmpty) {
          return MediaPickerResponse(
            files: pickedFiles.map((file) => File(file.path)).toList(),
          );
        }
        return null;
      }

      if (mediaType == MediaType.image || mediaType == MediaType.both) {
        final XFile? pickedFile = await _picker.pickImage(
          source: imageSource,
          imageQuality: imageQuality,
        );
        if (pickedFile != null) {
          return MediaPickerResponse(
            files: [File(pickedFile.path)],
          );
        }
      }

      if (mediaType == MediaType.video || mediaType == MediaType.both) {
        final XFile? pickedFile = await _picker.pickVideo(
          source: imageSource,
          maxDuration: maxVideoDuration,
        );
        if (pickedFile != null) {
          return MediaPickerResponse(
            files: [File(pickedFile.path)],
            isVideo: true,
          );
        }
      }

      return null;
    }

    return await showModalBottomSheet<MediaPickerResponse>(
      context: context,
      backgroundColor: bottomSheetBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: bottomSheetBorderRadius ?? const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Container(
        padding: bottomSheetPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (bottomSheetTitle.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (bottomSheetIcon != null) ...[
                      bottomSheetIcon,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      bottomSheetTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
            if (mediaType == MediaType.image || mediaType == MediaType.both) ...[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(cameraLabel, style: optionTextStyle),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: imageQuality,
                  );
                  if (pickedFile != null) {
                    Navigator.pop(context, MediaPickerResponse(files: [File(pickedFile.path)]));
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(galleryLabel, style: optionTextStyle),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: imageQuality,
                  );
                  if (pickedFile != null) {
                    Navigator.pop(context, MediaPickerResponse(files: [File(pickedFile.path)]));
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              if (allowMultiple)
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(multipleImagesLabel, style: optionTextStyle),
                  onTap: () async {
                    final List<XFile> pickedFiles = await _picker.pickMultiImage(imageQuality: imageQuality);
                    if (pickedFiles.isNotEmpty) {
                      Navigator.pop(
                        context,
                        MediaPickerResponse(files: pickedFiles.map((file) => File(file.path)).toList()),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
            ],
            if (mediaType == MediaType.video || mediaType == MediaType.both) ...[
              ListTile(
                leading: const Icon(Icons.videocam),
                title: Text('Camera $videoLabel', style: optionTextStyle),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickVideo(
                    source: ImageSource.camera,
                    maxDuration: maxVideoDuration,
                  );
                  if (pickedFile != null) {
                    Navigator.pop(context, MediaPickerResponse(files: [File(pickedFile.path)], isVideo: true));
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: Text('Gallery $videoLabel', style: optionTextStyle),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickVideo(
                    source: ImageSource.gallery,
                    maxDuration: maxVideoDuration,
                  );
                  if (pickedFile != null) {
                    Navigator.pop(context, MediaPickerResponse(files: [File(pickedFile.path)], isVideo: true));
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum MediaType { image, video, both }

enum PickerSource { camera, gallery, both }

class MediaPickerResponse {
  final List<File> files;
  final bool isVideo;

  MediaPickerResponse({required this.files, this.isVideo = false});

  File get singleFile => files.first;

  bool get hasSingleFile => files.length == 1;

  bool get hasMultipleFiles => files.length > 1;
}
