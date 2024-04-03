import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/assets/us_states.dart';
import 'package:mrb/src/common/dropdown.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/main_page/view/main_page_view.dart';
import 'package:mrb/src/profile_completion_page/bloc/profile_completion_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_event.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileCompletionPage extends StatefulWidget {
  const ProfileCompletionPage({super.key});

  @override
  State<ProfileCompletionPage> createState() => ProfileCompletionPageState();
}

class ProfileCompletionPageState extends State<ProfileCompletionPage> {
  String? primaryLicenseState;
  int? primaryLicenseYear;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _referralCodeController = TextEditingController();
  final _primaryLicenseNumberController = TextEditingController();
  bool termsAndAgreemntsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
            listeners: [
          BlocListener<ProfileCompletionBloc, ProfileCompletionState>(
              listener: (context, state) {
            if (state is ProfileCompletionFailedState) {
              print("Snacky ${state.hashCode}");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
            if (state is ProfileCompletionSuccessState) {
              print("Snacky B ${state.hashCode}");
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Sucessfully created"),
              ));

              if (FirebaseAuth.instance.currentUser == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Not logged in."),
                ));
                return;
              }

              context.read<LoginCubit>().getUserData(
                  email: FirebaseAuth.instance.currentUser!.email!);
            }
          }),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessfullyGotDataState) {
                context.read<ReferralCentreBloc>().add(
                    ReferralCentreLoadingEvent(
                        city: 'New York', state: 'California'));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              } else if (state is LoginFailedGettingDataState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Error = $state")));
              }
            },
          ),
        ],
            child: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset("assets/logo.png")],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Create Account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    inputField(const Icon(Icons.person), 'Enter Full Name',
                        _nameController),
                    inputField(const Icon(Icons.phone_android),
                        'Enter Phone number', _phoneController,
                        textInputType: TextInputType.phone),
                    inputField(const Icon(Icons.link),
                        'Enter your referral code', _referralCodeController),
                    inputField(
                        const Icon(Icons.edit_document),
                        'Primary License Number',
                        _primaryLicenseNumberController,
                        textInputType: TextInputType.number),
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
                    Row(
                      children: [
                        Checkbox(
                            value: termsAndAgreemntsAccepted,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  termsAndAgreemntsAccepted = value;
                                });
                              }
                            }),
                        const Expanded(
                          child: Text(
                            'I confirm that I have read and accepted the terms and agreements',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (primaryLicenseState == null) {
                          context.read<ProfileCompletionBloc>().add(
                              ProfileCompletionErrorEvent(
                                  type: ProfileCompletionPageErrorTypes
                                      .stateNotSelected,
                                  message: "Please select license state"));
                          return;
                        }
                        if (primaryLicenseYear == null) {
                          context.read<ProfileCompletionBloc>().add(
                              ProfileCompletionErrorEvent(
                                  type: ProfileCompletionPageErrorTypes
                                      .yearNotSelected,
                                  message: "Please select license year"));
                          return;
                        }
                        if (!termsAndAgreemntsAccepted) {
                          context.read<ProfileCompletionBloc>().add(
                              ProfileCompletionErrorEvent(
                                  type: ProfileCompletionPageErrorTypes
                                      .termsNotAccepted,
                                  message:
                                      "Please accept the terms and agreements"));
                          return;
                        }
                        context.read<ProfileCompletionBloc>().add(
                            ProfileCompletionSubmitEvent(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                referralCode: _referralCodeController.text,
                                licenseNumber:
                                    _primaryLicenseNumberController.text,
                                licenseState: primaryLicenseState!,
                                licenseYear: primaryLicenseYear!));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: CustomTheme.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Complete Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
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
          contentPadding: const EdgeInsets.all(15),
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
