import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
      if (state is ProfilePageLoadingState) {
        print('Loading');
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProfilePageSuccessState) {
        return SafeArea(
          minimum: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                associateAction(context,
                    userAssociaation: state.associationStatus,
                    profileEmail: state.email!),
                Container(
                  child: state.photo == null
                      ? null
                      : Image.memory(base64Decode(state.photo!)),
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
                      Text('Email'),
                      Text('${state.email} '),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('SSN'), Text('${state.ssn}')]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Occupation'),
                      Text('${state.occupation}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender'),
                      Text('${state.gender}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone'),
                      Text('${state.phone}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Licence Number'),
                      Text('${state.licenceNumber}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Licence State'),
                      Text('${state.licenceState}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Year Licenced'),
                      Text('${state.yearLicenced}'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address'),
                      Text('${state.address}'),
                    ]),
                Text('Previous Deals:'),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.previousDeals!.length,
                  itemBuilder: (context, index) => Container(
                    height: 120,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Property Address'),
                              Text(
                                  '${state.previousDeals![index].propertyAddress}'),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('List Price'),
                              Text('${state.previousDeals![index].listPrice}'),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sold Price'),
                              Text('${state.previousDeals![index].soldPrice}')
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Seller Subsidy'),
                              Text(
                                  '${state.previousDeals![index].sellerSubsidy}'),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Closing Date'),
                              Text(
                                  '${state.previousDeals![index].dateOfClosing}'),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Client Email'),
                              Text(
                                  '${state.previousDeals![index].clientEmail}'),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Proof"),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.memory(
                                    state.previousDeals![index].bytes!))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MainPageBloc>(context)
                          .add(ChangePageEvent(page: 2));
                    },
                    child: const Text('Edit Profile'))
              ],
            ),
          ),
        );
      }
      return CircularProgressIndicator();
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
