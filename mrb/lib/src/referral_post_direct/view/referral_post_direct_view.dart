import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_bloc.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_event.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_state.dart';
import 'package:mrb/src/referral_post_direct/view/widgets/top_agents_widget.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralPostDirectPage extends StatelessWidget {
  const ReferralPostDirectPage(
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
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.all(20),
            child: BlocBuilder<ReferralPostDirectBloc, ReferralPostDirectState>(
                builder: (context, state) {
              print(state);
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // const CustomTopBarWidget(
                  //   height: 200,
                  //   key: ,
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.read<ReferralPostDirectBloc>().add(
                                ReferralPostDirectChangeTabEvent(
                                    tab: PostDirectTab.topAgents));
                            context.read<ReferralPostDirectBloc>().add(
                                ReferralPostDirectTopAgentsLoadingEvent(
                                    state: clientState,
                                    clientType: clientType));
                          },
                          child: Column(
                            children: [
                              TextCustom('Top Agents'),
                              Container(
                                color: state is ReferralPostDirectTopAgentsState
                                    ? CustomTheme.primaryColor
                                    : null,
                                height: 3,
                                width: 120,
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ReferralPostDirectBloc>().add(
                              ReferralPostDirectChangeTabEvent(
                                  tab: PostDirectTab.yourNetwork));
                          context.read<ReferralPostDirectBloc>().add(
                              ReferralPostDirectYourNetworkLoadingEvent(
                                  state: clientState, clientType: clientType));
                        },
                        child: Column(
                          children: [
                            TextCustom('Your Network'),
                            Container(
                              color: state is ReferralPostDirectYourNetworkState
                                  ? CustomTheme.primaryColor
                                  : null,
                              height: 3,
                              width: 120,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state is ReferralPostDirectTopAgentsLoadingState)
                    const CircularProgressIndicator(),
                  if (state is ReferralPostDirectYourNetworkLoadingState)
                    const CircularProgressIndicator(),
                  if (state is ReferralPostDirectTopAgentsSuccessState)
                    ReferralPostDirectTopAgentsWidget(
                      clientState: clientState,
                      city: city,
                      desiredAt: desiredAt,
                      clientType: clientType,
                      price: price,
                    ),
                  if (state is ReferralPostDirectYourNetworkSuccessState)
                    Container()
                ],
              );
            }),
          ),
        ));
  }
}
