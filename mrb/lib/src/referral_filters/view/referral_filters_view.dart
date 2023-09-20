import 'package:flutter/material.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';

class ReferralFiltersPage extends StatelessWidget {
  const ReferralFiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              filterTextField(context, 'Time Span'),
              filterTextField(context, 'Cost'),
              SizedBox(width: double.infinity, child: TextCustom('Type')),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff4B4B4B)),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextCustom('Buyer'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff4B4B4B)),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextCustom('Seller'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity, child: TextCustom('Type of House')),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  typeOfHouse(context, 'Single Family'),
                  typeOfHouse(context, 'Town Home'),
                  typeOfHouse(context, 'Row Home'),
                  typeOfHouse(context, 'Condo'),
                  typeOfHouse(context, 'Duplex'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(width: double.infinity, child: TextCustom('City')),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'Referral City',
                    fillColor: const Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(width: double.infinity, child: TextCustom('State')),
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
                height: 60,
              ),
            ],
          ),
        ),
        CustomButton(onPressed: () {}, text: 'Apply Filters')
      ],
    );
  }
}

Widget typeOfHouse(BuildContext context, final String name) => Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff4B4B4B)),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        name,
        style: const TextStyle(color: Color(0xff888888)),
      ),
    );

Widget filterTextField(BuildContext context, final String title) => Column(
      children: [
        SizedBox(width: double.infinity, child: TextCustom(title)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Min',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              color: const Color(0xff646464),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 120,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Max',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
