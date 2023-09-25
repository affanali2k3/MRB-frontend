import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Container(
            // height: (screenHeight * 0.8),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom('Apply for Referral', fontSize: 18),
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff888888)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CustomProfilePhoto(),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              TextCustom('Ahmad Ali'),
                              TextCustom('California, CA', secondary: true),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0xffEDFDF7),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text('Seller'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Image.asset('assets/icons/referral_centre/date.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCustom('Within 2 Months', secondary: true),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLength: 200,
                  style: const TextStyle(
                      color: CustomTheme.nightSecondaryFontColor),
                  controller: _proposalController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      counterStyle: const TextStyle(color: Color(0xffB8B8B8)),
                      hintText: 'Your proposal for the Referral...',
                      hintStyle: const TextStyle(
                          color: CustomTheme.nightSecondaryFontColor),
                      filled: true,
                      fillColor: CustomTheme.nightAppbarColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: 'Applying As ',
                          style: TextStyle(color: CustomTheme.nightFontColor),
                          children: [
                            TextSpan(
                                text: 'John Doe',
                                style: TextStyle(
                                    color: CustomTheme.nightFontColor,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomTheme.nightSecondaryFontColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Image.asset(
                          'assets/icons/referral_centre/document.png',
                        ),
                        TextCustom('Attachment', secondary: true)
                      ]),
                    ),
                  ],
                ),
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
              print(_proposalController.text);
              context.read<ReferralCentreBloc>().add(
                  ReferralCentreApplyLeadEvent(
                      receiverAgent: GlobalVariables.user.id,
                      senderAgentFormId: widget.senderAgentFormId,
                      proposal: _proposalController.text));
              Navigator.pop(context);
            },
            text: 'Send Proposal',
          ),
        )
      ],
    );
  }
}
