import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileAboutPage extends StatelessWidget {
  const ProfileAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromARGB(11, 0, 0, 0)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(4, 4),
                    color: Color.fromARGB(10, 0, 0, 0))
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'About me',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1.5,
                width: double.infinity,
                color: const Color(0xffEBEBEB),
              ),
              const SizedBox(
                height: 20,
              ),
              TextCustom(
                  'Lorem ipsum dolor sit amet consectetur. Pellentesque et augue amet pulvinar risus pulvinar. Viverra ornare donec mauris sit faucibus pulvinar sit amet tellus in...'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromARGB(11, 0, 0, 0)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(4, 4),
                    color: Color.fromARGB(10, 0, 0, 0))
              ]),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child:
                      TextCustom('Personal Stats', fontSize: 18, bold: true)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1.5,
                width: double.infinity,
                color: const Color(0xffEBEBEB),
              ),
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
                              color: const Color.fromRGBO(55, 143, 233, 0.16),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            '24 Active Years',
                            style:
                                TextStyle(color: CustomTheme.primaryColorDeep),
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
                            personalStat(context, CustomTheme.primaryColor,
                                '352 Total Deals'),
                            const SizedBox(
                              height: 20,
                            ),
                            personalStat(context, const Color(0xff347654),
                                '322 Successful Deals'),
                            const SizedBox(
                              height: 20,
                            ),
                            personalStat(context, const Color(0xffE4BB40),
                                '26 Uncompleted'),
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
                                  border: Border.all(
                                      color: CustomTheme.primaryColor),
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
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromARGB(11, 0, 0, 0)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(4, 4),
                    color: Color.fromARGB(10, 0, 0, 0))
              ]),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child:
                      TextCustom('Overall Review', fontSize: 18, bold: true)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1.5,
                width: double.infinity,
                color: const Color(0xffEBEBEB),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
            ],
          ),
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
