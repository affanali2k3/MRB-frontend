import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_state.dart';
import 'package:mrb/src/referral_centre/view/widgets/lead_apply_widget.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentreLeadDisplayWidget extends StatelessWidget {
  const ReferralCentreLeadDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralCentreBloc, ReferralCentreState>(
        builder: (context, state) {
      if (state is ReferralCentreLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is ReferralCentreFailedState) {
        return Text('Error: ${state.error}');
      } else if (state is ReferralCentreSuccessState) {
        return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.leads.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                width: 200,
                decoration: BoxDecoration(
                    color: CustomTheme.nightSecondaryColor,
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
                            TextCustom('Ahmed Ali'),
                            TextCustom(
                                '${state.leads[index].city}, ${state.leads[index].state}',
                                secondary: true)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xffEDFDF7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            state.leads[index].isBuyer ? 'Buyer' : 'Seller'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Time Span:',
                          style: TextStyle(color: Color(0xffB8B8B8)),
                        )),
                    Row(
                      children: [
                        Image.asset('assets/icons/referral_centre/date.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          state.leads[index].desiredDate.toString(),
                          style: const TextStyle(color: Color(0xffB8B8B8)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                            // isScrollControlled: true,
                            backgroundColor: CustomTheme.nightBackgroundColor,
                            context: context,
                            builder: (context) =>
                                ReferralCentreLeadApplyWidget());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.primaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextCustom('Apply For Lead'),
                      ),
                    )
                  ],
                ),
              );
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
