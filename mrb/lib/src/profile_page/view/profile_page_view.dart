import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_open_forms_sent/view/agent_forms_received_view.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_bloc.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_event.dart';
import 'package:mrb/src/user_timeline/view/user_timeline_view.dart';

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
        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                associateAction(context,
                    userAssociaation: state.associationStatus,
                    profileEmail: state.email!),
                SizedBox(
                  child: Image.network(
                    '${GlobalVariables.url}/user/avatar/${state.email}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // Handle the error here
                      return const Text('Error loading image');
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Name'),
                      Text('${state.name}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Email'),
                      Text('${state.email} '),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Occupation'),
                      Text('${state.occupation}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gender'),
                      Text('${state.gender}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Phone'),
                      Text('${state.phone}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Licence Number'),
                      Text('${state.licenceNumber}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Licence State'),
                      Text('${state.licenceState}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Year Licenced'),
                      Text('${state.yearLicenced}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Address'),
                      Text('${state.address}'),
                    ]),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MainPageBloc>(context)
                          .add(ChangePageEvent(page: 2));
                    },
                    child: const Text('Edit Profile')),
                CustomOutlineButton(
                    onPressed: () {
                      BlocProvider.of<UserTimelineBloc>(context).add(
                          UserTimelineLoadingEvent(userEmail: state.email!));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserTimelinePage(userEmail: state.email!)));
                    },
                    text: 'Timeline'),
                const SizedBox(
                  height: 20,
                ),
                CustomOutlineButton(
                    onPressed: () {
                      BlocProvider.of<AgentOpenFormsSentBloc>(context).add(
                          AgentOpenFormsSentLoadingEvent(
                              userEmail: state.email!));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AgentOpenFormsSentPage()));
                    },
                    text: 'Shared Leads'),
              ],
            ),
          ),
        );
      }
      return const CircularProgressIndicator();
    }));
  }
}

Widget associateAction(BuildContext context,
    {required UserAssociationModel? userAssociaation,
    required String profileEmail}) {
  if (userAssociaation == null &&
      profileEmail == FirebaseAuth.instance.currentUser?.email) {
    return const SizedBox();
  } else if (userAssociaation == null) {
    return ElevatedButton(
        onPressed: () => context.read<ProfilePageBloc>().add(
            ProfilePageSendAssociateRequestEvent(
                senderEmail: FirebaseAuth.instance.currentUser!.email!,
                receiverEmail: profileEmail)),
        child: const Text('Send Request'));
  } else if (userAssociaation.senderEmail ==
          FirebaseAuth.instance.currentUser?.email &&
      userAssociaation.status == 'Pending') {
    return const Text('Request already sent');
  } else if (userAssociaation.receiverEmail ==
          FirebaseAuth.instance.currentUser?.email &&
      userAssociaation.status == 'Pending') {
    return ElevatedButton(
        onPressed: () {
          context.read<ProfilePageBloc>().add(
              ProfilePageAcceptAssociateRequestEvent(
                  senderEmail: profileEmail,
                  receiverEmail: FirebaseAuth.instance.currentUser!.email!));
        },
        child: const Text('Accept'));
  } else if (userAssociaation.status == 'Accepted') {
    return const Text('Associates');
  } else {
    return const Text('Error');
  }
}
