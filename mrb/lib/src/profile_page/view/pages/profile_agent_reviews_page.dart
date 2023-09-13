import 'package:flutter/material.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileAgentReviewsPage extends StatelessWidget {
  const ProfileAgentReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration:
              const BoxDecoration(color: CustomTheme.nightSecondaryColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom('Chrinstinia Williamson'),
                  TextCustom('29 July 2022', secondary: true),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RatingBarIndicator(
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
    );
  }
}
