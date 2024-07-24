// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
// #docregion photo-picker-example
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// #enddocregion photo-picker-example
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';

void appMain() {
  enableFlutterDriverExtension();
  main();
}

void main() {
  // Set to use Android Photo Picker.
  // #docregion photo-picker-example
  final ImagePickerPlatform imagePickerImplementation =
      ImagePickerPlatform.instance;
  if (imagePickerImplementation is ImagePickerAndroid) {
    imagePickerImplementation.useAndroidPhotoPicker = true;
  }
  // #enddocregion photo-picker-example
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Picker Demo',
      home: MyHomePage(title: 'Image Picker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> uploadPhotos() async {
    final List<XFile> photoList = await ImagePickerPlatform.instance
        .getMultiImageWithOptions(options: MultiImagePickerOptions(limit: 2));
    var s = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            uploadPhotos();
          },
          child: Text('Upload Photo'),
        ),
      ),
    );
  }
}
