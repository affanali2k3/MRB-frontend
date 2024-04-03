import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:mrb/assets/us_states.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/dropdown.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_state.dart';
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

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _emailController = TextEditingController();
  String? primaryLicenseState;
  int? primaryLicenseYear;

  @override
  void initState() {
    super.initState();
    if (GlobalVariables.user.biography != null) {
      _bioController.text = GlobalVariables.user.biography as String;
    }

    _nameController.text = GlobalVariables.user.name;
    _phoneController.text = GlobalVariables.user.phone ?? "";
    _addressController.text = GlobalVariables.user.address ?? "";
    primaryLicenseState = GlobalVariables.user.licenseState;
    primaryLicenseYear = GlobalVariables.user.licenseYear;
    _licenseNumberController.text = GlobalVariables.user.licenseNumber ?? "";
    _emailController.text = GlobalVariables.user.email;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileEditSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Succesfully set profile")));
          Navigator.pop(context);
        } else if (state is ProfileEditFailedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
        }
      },
      child: Scaffold(
          backgroundColor: CustomTheme.nightBackgroundColor,
          body: SafeArea(
            minimum: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(withData: true);
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
                                radius: 68,
                                backgroundImage: AssetImage(
                                    'assets/default_profile_photo.jpeg'))
                            : CircleAvatar(
                                radius: 68,
                                backgroundImage: MemoryImage(avatarbytes!))),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField(Image.asset('assets/profile/name.png', height: 10),
                      'Name', _nameController),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: _emailController,
                      enabled: false,
                      decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/profile/email.png'),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  inputField(
                      Image.asset('assets/profile/phone.png', height: 10),
                      'Phone',
                      _phoneController),
                  inputField(
                      Image.asset('assets/profile/location.png', height: 10),
                      'Address',
                      _addressController),
                  CustomDropDown(
                      defaultSelectedOption:
                          primaryLicenseState ?? usStatesRegistration[0],
                      items: usStatesRegistration,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onChanged: (value) {
                        setState(() {
                          primaryLicenseState = value;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField(
                      Image.asset('assets/profile/number.png', height: 10),
                      'License Number',
                      _licenseNumberController),
                  GestureDetector(
                      onTap: () {
                        showYearPicker(
                          context,
                          primaryLicenseYear,
                          onChanged: (DateTime dateTime) {
                            // close the dialog when year is selected.
                            setState(() {
                              primaryLicenseYear = dateTime.year;
                            });
                            Navigator.pop(context);

                            // Do something with the dateTime selected.
                            // Remember that you need to use dateTime.year to get the year
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Icon(Icons.date_range),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              primaryLicenseYear == null
                                  ? "Primary License Year"
                                  : primaryLicenseYear.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(178, 0, 0, 0)),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: _bioController,
                      maxLines: 6,
                      maxLength: 200,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                  CustomButton(
                      onPressed: () {
                        context.read<ProfileEditBloc>().add(ProfileEditSetEvent(
                            biography: _bioController.text,
                            avatarMimeType: avatarMimeType,
                            avatarbytes: avatarbytes,
                            name: _nameController.text,
                            phone: _phoneController.text,
                            address: _addressController.text,
                            licenseState: primaryLicenseState,
                            licenseNumber: _licenseNumberController.text,
                            licenseYear: primaryLicenseYear));
                      },
                      text: 'Update Profile')
                ],
              ),
            ),
          )),
    );
  }
}

Widget inputField(
    Widget prefixIcon, String hintText, TextEditingController controller,
    {TextInputType? textInputType}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}

Future<dynamic> showYearPicker(BuildContext context, int? licenseYear,
    {required void Function(DateTime) onChanged}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Select Year"),
        content: SizedBox(
          // Need to use container to add size constraint.
          width: 300,
          height: 300,
          child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: DateTime.now(),
              onChanged: onChanged),
        ),
      );
    },
  );
}
