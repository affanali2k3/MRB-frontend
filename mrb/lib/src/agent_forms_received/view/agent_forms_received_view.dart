import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class AgentFormsReceivedPage extends StatelessWidget {
  const AgentFormsReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: BlocBuilder<AgentFormsReceivedBloc, AgentFormsReceivedState>(
            builder: (context, state) {
          if (state is AgentFormsReceivedSuccessState) {
            customSnackBar(message: state.message, context: context);
          } else if (state is AgentFormsReceivedFailedState) {
            customSnackBar(message: state.error, context: context);
          }
          if (state is AgentFormsReceivedLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgentFormsReceivedSuccessState) {
            return SafeArea(
              minimum: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTopBarWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: state.receivedForms.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: CustomTheme.nightSecondaryColor),
                          child: Column(children: [
                            Row(
                              children: [
                                const CustomProfilePhoto(),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    TextCustom(state
                                        .receivedForms[index].senderAgentName),
                                    RatingBarIndicator(
                                      rating: state.receivedForms[index]
                                          .senderAgentRating,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Color(0xffE4BB40),
                                        // size: 10,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    TextCustom(state.receivedForms[index]
                                        .senderAgentReferralsSent
                                        .toString()),
                                    TextCustom('Referrals Sent')
                                  ],
                                ),
                                Column(
                                  children: [
                                    TextCustom(state.receivedForms[index]
                                        .senderAgentReferralsReceived
                                        .toString()),
                                    TextCustom('Referrals Received')
                                  ],
                                ),
                                Column(
                                  children: [
                                    TextCustom(state
                                        .receivedForms[index].senderAgentRating
                                        .toString()),
                                    TextCustom('Rating')
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 110,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: CustomTheme.errorColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextCustom('Reject'),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 110,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: CustomTheme.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextCustom('Accept'),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        }));
  }
}
