import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_state.dart';
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/default_profile_photo.jpeg',
                                    width: 120,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Eduardo',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: CustomTheme.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '1h ago',
                                      style: TextStyle(
                                        color: CustomTheme.tertiaryFontColor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBarIndicator(
                                      rating: 2.75,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        // size: 10,
                                      ),
                                      itemCount: 1,
                                      itemSize: 17.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      '4.7 (6.8K review)',
                                      style: TextStyle(
                                          color:
                                              CustomTheme.secondaryFontColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffEDFDF7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(state.leads[index].isBuyer
                                          ? 'Buyer'
                                          : 'Seller'),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/icons/referral_centre/location.png'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text('California, CA')
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '\$${state.leads[index].price.toInt().toString()}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: CustomTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: CustomTheme
                                                  .nightTertiaryFontColor),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        state.leads[index].typeOfHouse,
                                        style: const TextStyle(
                                            color: CustomTheme
                                                .nightTertiaryFontColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   showModalBottomSheet<dynamic>(
                        //       backgroundColor:
                        //           CustomTheme.nightBackgroundColor,
                        //       context: context,
                        //       builder: (context) =>
                        //           ReferralCentreLeadApplyWidget(
                        //             senderAgentFormId:
                        //                 state.leads[index].id,
                        //           ));
                        // },
                        child: state.leads[index].senderAgent ==
                                GlobalVariables.user.id
                            ? TextCustom("Posted By You")
                            : InkWell(
                                onTap: () {
                                  showModalBottomSheet<dynamic>(
                                      backgroundColor:
                                          CustomTheme.nightBackgroundColor,
                                      context: context,
                                      builder: (context) =>
                                          ReferralCentreLeadApplyWidget(
                                            senderAgentFormId:
                                                state.leads[index].id,
                                          ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  // width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: CustomTheme.primaryColorDeep,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text(
                                    'Apply For Lead',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                      )
                    ],
                  )
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         // const CustomProfilePhoto(),
                  //         ClipRRect(child: Image.asset(name),)
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             TextCustom('Ahmed Ali'),
                  //             TextCustom(
                  //                 '${state.leads[index].city}, ${state.leads[index].state}',
                  //                 secondary: true)
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.all(5),
                  //           decoration: BoxDecoration(
                  //               color: const Color(0xffEDFDF7),
                  //               borderRadius: BorderRadius.circular(10)),
                  //           child: Text(
                  //               state.leads[index].isBuyer ? 'Buyer' : 'Seller'),
                  //         ),
                  //         const SizedBox(
                  //           width: 5,
                  //         ),
                  //         const CircleAvatar(
                  //           backgroundColor: Color(0xffD9D9D9),
                  //           radius: 4,
                  //         ),
                  //   const SizedBox(
                  //     width: 5,
                  //   ),
                  //   TextCustom(
                  //       'Posted ${DateTime.now().difference(state.leads[index].postedAt).inMinutes}m ago')
                  // ],
                  //     ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  // TextCustom(
                  //     '\$${state.leads[index].price.toInt().toString()}',
                  //     bold: true,
                  //     fontSize: 18),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: const Color(0xff3B82F6)),
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: Text(
                  //     state.leads[index].typeOfHouse,
                  //     style: const TextStyle(color: Color(0xff3B82F6)),
                  //   ),
                  // ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Image.asset('assets/icons/referral_centre/date.png'),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           'Within ${state.leads[index].timeAmount} Months',
                  //           style: const TextStyle(color: Color(0xffB8B8B8)),
                  //         )
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  // GestureDetector(
                  //   onTap: () {
                  //   showModalBottomSheet<dynamic>(
                  //       backgroundColor: CustomTheme.nightBackgroundColor,
                  //       context: context,
                  //       builder: (context) => ReferralCentreLeadApplyWidget(
                  //             senderAgentFormId: state.leads[index].id,
                  //           ));
                  // },
                  //   child: state.leads[index].senderAgent ==
                  //           GlobalVariables.user.id
                  //       ? TextCustom("Posted By You")
                  //       : Container(
                  //           alignment: Alignment.center,
                  //           width: double.infinity,
                  //           padding: const EdgeInsets.all(10),
                  //           decoration: BoxDecoration(
                  //               border: Border.all(
                  //                   color: const Color(0xff3B82F6)),
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: TextCustom('Apply For Lead'),
                  //         ),
                  // )
                  //   ],
                  // ),
                  );
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
