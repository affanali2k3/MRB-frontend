import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/profile/bloc/profile_bloc.dart';
import 'package:mrb/profile/bloc/profile_event.dart';
import 'package:mrb/profile/view/profile_view.dart';
import 'package:mrb/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/profile_page/bloc/profile_page_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
      if (state is ProfilePageLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProfilePageSuccessState) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(base64Decode(state.photo)),
            Text('Name: ${state.name}'),
            Text('Email: ${state.email} '),
            Text('SSN: ${state.ssn}'),
            Text('Occupation ${state.occupation}'),
            Text('Gender ${state.gender}'),
            Text('Licence ${state.licence}'),
            Text('Phone ${state.phone}'),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProfileBloc>(context).add(ProfileSetEvent(
                      name: state.name,
                      ssn: state.ssn,
                      licence: state.licence,
                      phone: state.phone,
                      occupation: state.occupation,
                      gender: state.gender));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileEditPage()));
                },
                child: const Text('Edit Profile'))
          ],
        );
      }
      return CircularProgressIndicator();
    }));
  }
}
