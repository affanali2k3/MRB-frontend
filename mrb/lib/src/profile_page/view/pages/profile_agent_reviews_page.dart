import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileAgentReviewsPage extends StatelessWidget {
  const ProfileAgentReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xfff9f9f9),
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.09))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    starRatingIndication(context, '5', 30),
                    starRatingIndication(context, '4', 25),
                    starRatingIndication(context, '3', 20),
                    starRatingIndication(context, '2', 15),
                    starRatingIndication(context, '1', 5),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    '4.0',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      // size: 10,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('52 Reviews'),
                ],
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(20),
              decoration:
                  const BoxDecoration(color: CustomTheme.nightSecondaryColor),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Column(
                        children: [
                          CustomProfilePhoto(),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Chrinstinia Williamson',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
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
                              const Text(
                                '29 July 2022',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextCustom(
                      secondary: true,
                      'Lorem ipsum dolor sit amet consectetur. Pellentesque et augue amet pulvinar risus pulvinar. Viverra ornare donec mauris sit faucibus pulvinar sit amet tellus in.')
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget starRatingIndication(BuildContext context, String star, double width) {
  return Row(
    children: [
      Text(star),
      const SizedBox(
        width: 5,
      ),
      const Icon(
        Icons.star,
        color: Colors.amber,
        size: 14,
      ),
      const SizedBox(
        width: 5,
      ),
      Container(
        width: width,
        height: 4,
        color: const Color(0xff006D60),
      )
    ],
  );
}
