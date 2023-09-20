import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileAboutPage extends StatelessWidget {
  const ProfileAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Container(
          // padding: const EdgeInsets.all(20),
          child: TextCustom(
              'Lorem ipsum dolor sit amet consectetur. Pellentesque et augue amet pulvinar risus pulvinar. Viverra ornare donec mauris sit faucibus pulvinar sit amet tellus in...'),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: double.infinity,
            child: TextCustom('Personal Stats', fontSize: 18, bold: true)),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: CustomTheme.nightTertiaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      personalStat(
                          context, CustomTheme.primaryColor, '352 Total Deals'),
                      const SizedBox(
                        height: 20,
                      ),
                      personalStat(context, const Color(0xff347654),
                          '322 Successful Deals'),
                      const SizedBox(
                        height: 20,
                      ),
                      personalStat(
                          context, const Color(0xffE4BB40), '26 Uncompleted'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.primaryColor),
                            borderRadius: BorderRadius.circular(200)),
                        child: Column(
                          children: [
                            TextCustom('88%'),
                            TextCustom('Company'),
                            TextCustom('Growth')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextCustom('Overall Review', fontSize: 18, bold: true),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xff222c2a),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  TextCustom('4.8', fontSize: 45, bold: true),
                  RatingBarIndicator(
                    rating: 4.8,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      // size: 10,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextCustom('23,020', secondary: true)
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextCustom('Invited By'),
        TextCustom('Affan Ali', bold: true)
      ]),
    );
  }
}

Widget personalStat(BuildContext context, Color color, String text) => Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(
          width: 10,
        ),
        TextCustom(text)
      ],
    );
