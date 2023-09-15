import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_event.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_state.dart';
import 'package:mrb/src/edit_profile/model/deal_model.dart';
import 'package:mrb/src/homepage/homepage.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/login/view/login.dart';

// ignore: must_be_immutable
class ProfileEditPage extends StatelessWidget {
  String jobTime = 'Part time';
  String team = 'Team';
  List<Deal> previousDeals = [];
  final _name = TextEditingController();
  final _ssn = TextEditingController();
  final _licence = TextEditingController();
  final _phone = TextEditingController();
  final _occupation = TextEditingController();
  final _gender = TextEditingController();
  final _address = TextEditingController();
  final _licenceState = TextEditingController();
  final _licenceNumber = TextEditingController();
  final _yearLicenced = TextEditingController();
  final _numberOfCompletedDeals = TextEditingController();

  ProfileEditPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginLoggedOutState) {
        return LoginPage();
      } else if (state is LoginSuccessState) {
        return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
          if (state is ProfileSetLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileSetFailureState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final snackBar = SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });

            // return AlertDialog(content: Text(state.message));
          } else if (state is ProfileSetSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final snackBar = SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }
          return SafeArea(
            minimum: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  CustomOutlineButton(
                      onPressed: () => context
                          .read<ProfileBloc>()
                          .add(ProfileAddAvatarEvent()),
                      text: 'Add photo'),
                  CustomTextField(controller: _name, hintText: 'Name'),
                  CustomTextField(
                    controller: _phone,
                    hintText: 'Phone',
                    maxLength: 10,
                    keyboardInputType: TextInputType.phone,
                  ),
                  CustomTextField(
                      controller: _occupation, hintText: 'Occupation'),
                  CustomTextField(
                      controller: _licenceState, hintText: 'Licence state'),
                  CustomTextField(
                      controller: _licenceNumber,
                      hintText: 'Licence number',
                      keyboardInputType: TextInputType.number),
                  CustomTextField(
                    controller: _yearLicenced,
                    hintText: 'Year licenced',
                    maxLength: 4,
                    keyboardInputType: TextInputType.number,
                  ),
                  CustomTextField(
                    controller: _numberOfCompletedDeals,
                    hintText: 'Completed Deals',
                    maxLength: 10,
                    keyboardInputType: TextInputType.number,
                  ),
                  CustomTextField(
                    controller: _gender,
                    hintText: 'Gender',
                  ),
                  CustomTextField(
                    controller: _address,
                    hintText: 'Address',
                  ),
                  CustomOutlineButton(
                    onPressed: () => context.read<ProfileBloc>().add(
                        ProfileSetEvent(
                            name: _name.text,
                            ssn: _ssn.text,
                            licence: _licence.text,
                            address: _address.text,
                            licenceNumber: _licenceNumber.text,
                            licenceState: _licenceState.text,
                            yearLicenced: _yearLicenced.text,
                            numberOfCompletedDeals:
                                _numberOfCompletedDeals.text,
                            phone: _phone.text,
                            occupation: _occupation.text,
                            previousDeals: previousDeals,
                            gender: _gender.text)),
                    text: 'Set Profile',
                    primary: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomOutlineButton(
                      onPressed: () {
                        // BlocProvider.of<ProfilePageBloc>(context).add(
                        //     ProfilePageLoadingEvent(
                        //         userId:
                        //             FirebaseAuth.instance.currentUser!.email!,
                        //         associateEmail:
                        //             FirebaseAuth.instance.currentUser!.email!));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ProfilePage()));
                      },
                      text: 'Go to Profile'),
                  const SizedBox(height: 20),
                  CustomOutlineButton(
                    onPressed: () =>
                        context.read<ProfileBloc>().add(ProfileLogoutEvent()),
                    text: 'Logout',
                    primary: false,
                  ),
                  const SizedBox(height: 20),
                  CustomOutlineButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      text: 'Homepage'),
                ],
              ),
            ),
          );
        });
      } else {
        return LoginPage();
      }
    }));
  }
}
