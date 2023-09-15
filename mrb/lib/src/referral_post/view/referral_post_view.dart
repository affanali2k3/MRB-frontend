import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_bloc.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_event.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_state.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralPostPage extends StatelessWidget {
  const ReferralPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralPostBloc, ReferralPostState>(
      builder: (BuildContext context, ReferralPostState state) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom('Post a Referral', fontSize: 20),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Image.asset(
                            'assets/icons/referral_centre/close.png'))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 110,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xffE2E2E2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Image.asset('assets/icons/referral_centre/public.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Public'),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset('assets/icons/referral_centre/down.png'),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<ReferralPostBloc>()
                          .add(ReferralPostChangeIsBuyerEvent(isBuyer: true)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color:
                                state.isBuyer ? CustomTheme.primaryColor : null,
                            border: Border.all(
                                color: state.isBuyer
                                    ? CustomTheme.primaryColor
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextCustom('Buyer'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<ReferralPostBloc>()
                          .add(ReferralPostChangeIsBuyerEvent(isBuyer: false)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color:
                                state.isBuyer ? null : CustomTheme.primaryColor,
                            border: Border.all(
                                color: state.isBuyer
                                    ? Colors.white
                                    : CustomTheme.primaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextCustom('Seller'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('Type of House', fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                const Wrap(spacing: 10, runSpacing: 10, children: [
                  ReferralPostHouseTypeWidget(
                    houseType: HouseTypes.singleFamily,
                  ),
                  ReferralPostHouseTypeWidget(
                    houseType: HouseTypes.townHome,
                  ),
                  ReferralPostHouseTypeWidget(
                    houseType: HouseTypes.rowHome,
                  ),
                  ReferralPostHouseTypeWidget(
                    houseType: HouseTypes.condo,
                  ),
                  ReferralPostHouseTypeWidget(
                    houseType: HouseTypes.duplex,
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('State', fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Referral State',
                      fillColor: const Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('City', fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Referral State',
                      fillColor: const Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('Cost', fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText:
                          'House Cost For ${state.isBuyer ? 'Buying' : 'Selling'}',
                      fillColor: const Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Post Referral',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReferralPostHouseTypeWidget extends StatelessWidget {
  const ReferralPostHouseTypeWidget({Key? key, required this.houseType})
      : super(key: key);

  final String houseType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralPostBloc, ReferralPostState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context
              .read<ReferralPostBloc>()
              .add(ReferralPostChangeHouseTypeEvent(houseType: houseType)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                color: state.houseType == houseType
                    ? CustomTheme.primaryColor
                    : null,
                border: Border.all(
                    color: state.houseType == houseType
                        ? CustomTheme.primaryColor
                        : Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: TextCustom(houseType),
          ),
        );
      },
    );
  }
}
