import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/profile/bloc/profile_bloc.dart';
import 'package:mrb/profile/bloc/profile_event.dart';
import 'package:mrb/profile/bloc/profile_state.dart';
import 'package:mrb/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/profile_page/view/profile_page_view.dart';

class ProfileEditPage extends StatelessWidget {
  final _name = TextEditingController();
  final _ssn = TextEditingController();
  final _licence = TextEditingController();
  final _phone = TextEditingController();
  final _occupation = TextEditingController();
  final _gender = TextEditingController();

  ProfileEditPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: _ssn,
            decoration: const InputDecoration(hintText: 'SSN'),
          ),
          TextField(
            controller: _licence,
            decoration: const InputDecoration(hintText: 'Licence'),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(ProfileAddAvatarEvent());
              },
              child: const Text('Photo')),
          TextField(
            controller: _phone,
            decoration: const InputDecoration(hintText: 'Phone'),
          ),
          TextField(
            controller: _occupation,
            decoration: const InputDecoration(hintText: 'Occupation'),
          ),
          TextField(
            controller: _gender,
            decoration: const InputDecoration(hintText: 'Gender'),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(ProfileSetEvent(
                    name: _name.text,
                    ssn: _ssn.text,
                    licence: _licence.text,
                    phone: _phone.text,
                    occupation: _occupation.text,
                    gender: _gender.text));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: const Text('Set Profile')),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ProfilePageBloc>(context)
                    .add(ProfilePageLoadingEvent());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: const Text('Go to profile')),
          ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(ProfileLogoutEvent());
              },
              child: const Text('Logout'))
        ],
      );
    }));
  }
}
