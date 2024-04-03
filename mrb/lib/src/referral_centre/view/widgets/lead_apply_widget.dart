import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/loading_page/loading_page.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_apply_bloc/referral_apply_bloc_bloc.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentreLeadApplyWidget extends StatefulWidget {
  const ReferralCentreLeadApplyWidget(
      {Key? key, required this.senderAgentFormId})
      : super(key: key);
  final int senderAgentFormId;

  @override
  ReferralCentreLeadApplyWidgetState createState() =>
      ReferralCentreLeadApplyWidgetState();
}

class ReferralCentreLeadApplyWidgetState
    extends State<ReferralCentreLeadApplyWidget> {
  ReferralCentreLeadApplyWidgetState({
    Key? key,
  });

  final _proposalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ReferralApplyBloc, ReferralApplyState>(
      listener: (context, state) {
        if (state is ReferralApplyFailedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
        } else if (state is ReferralApplySuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Success: $state")));
          Navigator.pop(context);
        } else if (state is ReferralApplyLoadingState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoadingPage()));
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                // height: (screenHeight * 0.8),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Apply for Lead',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomTheme.primaryColor),
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Image.asset(
                                'assets/icons/referral_centre/close.png'))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: const Color(0xffEBEBEB),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff888888)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CustomProfilePhoto(),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextCustom('Ahmad Ali'),
                                      TextCustom('California, CA',
                                          secondary: true),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEDFDF7),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Seller'),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/icons/referral_centre/date.png'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('Within 2 Months',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                CustomTheme.tertiaryFontColor)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: const Color(0xffEBEBEB),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'About Lead',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo... Read more"),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Lead Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Image.asset(
                                  'assets/icons/referral_centre/location.png'),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'California, CA',
                                style: TextStyle(
                                    color: CustomTheme.tertiaryFontColor),
                              )
                            ])
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              'Budget',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$ 100,000',
                              style: TextStyle(
                                  color: CustomTheme.tertiaryFontColor),
                            )
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              'Property Type',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Family House',
                              style: TextStyle(
                                  color: CustomTheme.tertiaryFontColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: const Color(0xffEBEBEB),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Proposal',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      maxLength: 200,
                      style: const TextStyle(
                          color: CustomTheme.nightSecondaryFontColor),
                      controller: _proposalController,
                      maxLines: 10,
                      decoration: InputDecoration(
                          counterStyle:
                              const TextStyle(color: Color(0xffB8B8B8)),
                          hintText: 'Your proposal for the Referral...',
                          hintStyle: const TextStyle(
                              color: CustomTheme.nightSecondaryFontColor),
                          filled: true,
                          fillColor: const Color.fromRGBO(116, 116, 116, 0.08),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(184, 184, 184, 1)),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     RichText(
                    //       text: const TextSpan(
                    //           text: 'Applying As ',
                    //           style:
                    //               TextStyle(color: CustomTheme.nightFontColor),
                    //           children: [
                    //             TextSpan(
                    //                 text: 'John Doe',
                    //                 style: TextStyle(
                    //                     color: CustomTheme.nightFontColor,
                    //                     fontWeight: FontWeight.bold))
                    //           ]),
                    //     ),
                    //     Container(
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //           border: Border.all(
                    //               color: CustomTheme.nightSecondaryFontColor),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       child: Row(children: [
                    //         Image.asset(
                    //           'assets/icons/referral_centre/document.png',
                    //         ),
                    //         TextCustom('Attachment', secondary: true)
                    //       ]),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomTheme.primaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextCustom(
                                '204',
                              ),
                              TextCustom('Active Years')
                            ],
                          ),
                          Column(
                            children: [
                              TextCustom(
                                '204',
                              ),
                              TextCustom('Total deals')
                            ],
                          ),
                          Column(
                            children: [
                              TextCustom(
                                '8',
                              ),
                              TextCustom('Deals closed')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: CustomButton(
                onPressed: () {
                  context.read<ReferralApplyBloc>().add(ReferralApplyLeadEvent(
                      receiverAgent: GlobalVariables.user.id,
                      senderAgentFormId: widget.senderAgentFormId,
                      proposal: _proposalController.text));
                },
                text: 'Send Proposal',
              ),
            )
          ],
        );
      },
    );
  }
}
