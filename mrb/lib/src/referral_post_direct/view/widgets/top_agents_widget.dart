import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_bloc.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_state.dart';

class ReferralPostDirectTopAgentsWidget extends StatelessWidget {
  const ReferralPostDirectTopAgentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralPostDirectBloc, ReferralPostDirectState>(
        builder: (context, state) {
      return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 3,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomProfilePhoto(),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        TextCustom('Stuart Arnold '),
                        RatingBarIndicator(
                          rating: 2.75,
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
                  children: [TextCustom('204'), TextCustom('Active Years')],
                ),
                Column(
                  children: [TextCustom('204'), TextCustom('Active Years')],
                ),
                Column(
                  children: [TextCustom('204'), TextCustom('Active Years')],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onPressed: () {}, text: 'Send'),
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
