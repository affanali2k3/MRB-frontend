import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class AgentOpenFormsSentPage extends StatelessWidget {
  const AgentOpenFormsSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentOpenFormsSentBloc, AgentOpenFormsSentState>(
        builder: (context, state) {
      if (state is AgentOpenFormsSentFailedState) {
        customSnackBar(message: state.error, context: context);
      }
      if (state is AgentOpenFormsSentLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AgentOpenFormsSentSuccessState) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: state.sentForms.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: state.sentForms[index].status == 'Awaiting'
                                ? CustomTheme.nightTertiaryColor
                                : state.sentForms[index].status == 'Accepted'
                                    ? const Color(0xff273b31)
                                    : const Color(0xff351d21),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            children: [
                              const CustomProfilePhoto(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(state
                                      .sentForms[index].receiverAgentName
                                      .toString()),
                                  TextCustom(
                                      '${state.sentForms[index].city}, ${state.sentForms[index].state}',
                                      secondary: true)
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: const Color(0xffEDFDF7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(state.sentForms[index].isBuyer
                                    ? 'Buyer'
                                    : 'Seller'),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/icons/referral_centre/date.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Within ${state.sentForms[index].timeAmount} Months',
                                    style: const TextStyle(
                                        color: Color(0xffB8B8B8)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    height: 4,
                                    color: CustomTheme.nightSecondaryColor),
                              ),
                              Image.asset(
                                  'assets/icons/referrals_applied/Awaiting.png'),
                              TextCustom(state.sentForms[index].status)
                            ],
                          ),
                        ]),
                      );
                    })
              ],
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
