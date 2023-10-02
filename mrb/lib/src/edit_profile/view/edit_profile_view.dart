import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  ProfileEditPageState createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {
  final _bioController = TextEditingController();

  String? avatarMimeType;
  Uint8List? avatarbytes;

  String? coverPhotoMimeType;
  Uint8List? coverPhotoBytes;

  @override
  void initState() {
    super.initState();
    _bioController.text =
        'Lorem ipsum dolor sit amet consectetur. Pellentesque et augue amet pulvinar risus pulvinar. Viverra ornare donec mauris sit faucibus pulvinar sit amet tellus in...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(withData: true);
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        final String? mimeType = lookupMimeType(file.path!);
                        final Uint8List? buffer = file.bytes;

                        setState(() {
                          coverPhotoMimeType = mimeType;
                          coverPhotoBytes = buffer;
                        });
                      }
                    },
                    child: Container(
                        child: coverPhotoBytes == null
                            ? Container(
                                height: 200,
                                color: CustomTheme.nightSecondaryColor,
                              )
                            : Opacity(
                                opacity: 0.5,
                                child: Image.memory(
                                  coverPhotoBytes!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              )),
                  ),
                  GestureDetector(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(withData: true);
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          final String? mimeType = lookupMimeType(file.path!);
                          final Uint8List? buffer = file.bytes;

                          setState(() {
                            avatarMimeType = mimeType;
                            avatarbytes = buffer;
                          });
                        }
                      },
                      child: avatarbytes == null
                          ? const CircleAvatar(
                              radius: 48,
                              backgroundImage: AssetImage(
                                  'assets/default_profile_photo.jpeg'))
                          : CircleAvatar(
                              radius: 48,
                              backgroundImage: MemoryImage(avatarbytes!))),
                ]),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _bioController,
                    maxLines: 6,
                    maxLength: 200,
                    style: const TextStyle(
                        color: CustomTheme.nightSecondaryFontColor),
                    decoration: const InputDecoration(
                      counterStyle:
                          TextStyle(color: CustomTheme.nightSecondaryFontColor),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomTheme.nightSecondaryColor)),
                    )),
                CustomButton(
                    onPressed: () {
                      context.read<ProfileEditBloc>().add(ProfileEditSetEvent(
                          biography: _bioController.text,
                          avatarMimeType: avatarMimeType,
                          avatarbytes: avatarbytes,
                          coverPhotoBytes: coverPhotoBytes,
                          coverPhotoMimeType: coverPhotoMimeType));
                    },
                    text: 'Save changes')
              ],
            ),
          ),
        ));
  }
}
