import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_bloc.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_event.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_state.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class ReferralPostDirectTopAgentsWidget extends StatelessWidget {
  const ReferralPostDirectTopAgentsWidget(
      {Key? key,
      required this.clientState,
      required this.city,
      required this.desiredAt,
      required this.clientType,
      required this.price})
      : super(key: key);

  final String clientState;
  final String city;
  final DateTime desiredAt;
  final ClientType clientType;
  final double price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralPostDirectBloc, ReferralPostDirectState>(
        builder: (context, state) {
      final ReferralPostDirectTopAgentsSuccessState successState =
          state as ReferralPostDirectTopAgentsSuccessState;
      return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: successState.agents.length,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomProfilePhoto(
                      photo: successState.agents[index].photo,
                      userId: successState.agents[index].userId,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        TextCustom(successState.agents[index].name),
                        RatingBarIndicator(
                          rating: successState
                              .agents[index].agentToAgentRatingScore
                              .toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xff2e2e2e),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    '24 Active Years',
                    style: TextStyle(color: Color(0xff18A85E)),
                  ),
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
                    TextCustom(successState.agents[index].yearsOfExperience
                        .toString()),
                    TextCustom('Active Years')
                  ],
                ),
                Column(
                  children: [
                    TextCustom(successState.agents[index].referralsReceived
                        .toString()),
                    TextCustom('Refs Sent')
                  ],
                ),
                Column(
                  children: [
                    TextCustom(
                        successState.agents[index].referralsSent.toString()),
                    TextCustom('Refs Received')
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {
                  context
                      .read<ReferralPostDirectBloc>()
                      .add(ReferralPostSendReferralToAgentEvent(
                        senderAgent: GlobalVariables.user.id,
                        city: city,
                        desiredDate: desiredAt,
                        clientType: clientType,
                        formType: FormType.direct,
                        price: price,
                        receiverAgent: state.agents[index].userId,
                        state: clientState,
                      ));
                },
                text: 'Send'),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }
}
