import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/upload_video_controller.dart';
import 'package:tiktok/view/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  File video;
  String videopath;

  ConfirmScreen({super.key, required this.video, required this.videopath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  late VideoPlayerController videoplayercontroller;
  TextEditingController _songcontroller = TextEditingController();
  TextEditingController _captioncontroller = TextEditingController();
  UploadVideoController _uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      videoplayercontroller = VideoPlayerController.file(widget.video);
    });
    videoplayercontroller.initialize();
    videoplayercontroller.play();
    videoplayercontroller.setVolume(1);
    videoplayercontroller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoplayercontroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(videoplayercontroller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _songcontroller,
                      labeltext: 'Song Name',
                      icon: Icons.music_note,
                      isobscure: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _captioncontroller,
                      labeltext: 'Caption',
                      isobscure: false,
                      icon: Icons.closed_caption,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => _uploadVideoController.uploadVideo(
                          _songcontroller.text,
                          _captioncontroller.text,
                          widget
                              .videopath), //uploadVideoController.uploadVideo(
                      // _songcontroller.text,
                      // _captioncontroller.text,
                      // widget.video),
                      child: const Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
