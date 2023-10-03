import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_bloc.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class DirectFormsReceivedPage extends StatelessWidget {
  const DirectFormsReceivedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DirectFormsReceivedBloc, DirectFormsReceivedState>(
        builder: (context, state) {
      if (state is DirectFormsReceivedLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is DirectFormsReceivedSuccessState) {
        return ListView.builder(
          itemCount: state.directForms.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            width: 200,
            decoration: BoxDecoration(
                color: const Color(0xff2E2E2E),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CustomProfilePhoto(),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom('Ahmed Ali'),
                        TextCustom(
                            '${state.directForms[index].city}, ${state.directForms[index].state}',
                            secondary: true)
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xffEDFDF7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(state.directForms[index].isBuyer
                          ? 'Buyer'
                          : 'Seller'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      radius: 4,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextCustom(
                        'Posted ${DateTime.now().difference(state.directForms[index].createdAt).inMinutes}m ago')
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextCustom(
                    '\$${state.directForms[index].price.toInt().toString()}',
                    bold: true,
                    fontSize: 18),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff3B82F6)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    state.directForms[index].typeOfHouse ?? 'Any',
                    style: const TextStyle(color: Color(0xff3B82F6)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/referral_centre/date.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Within ${state.directForms[index].timeAmount} Months',
                      style: const TextStyle(color: Color(0xffB8B8B8)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // showModalBottomSheet<dynamic>(
                    //     backgroundColor: CustomTheme.nightBackgroundColor,
                    //     context: context,
                    //     builder: (context) => ReferralCentreLeadApplyWidget(
                    //           senderAgentFormId: state.leads[index].id,
                    //         ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff3B82F6)),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextCustom('Apply For Lead'),
                  ),
                )
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
