import 'package:flutter/material.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';

class ReferralCentreLeadPostWidget extends StatelessWidget {
  const ReferralCentreLeadPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    icon: Image.asset('assets/icons/referral_centre/close.png'))
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextCustom('Buyer'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextCustom('Seller'),
                ),
              ],
            ),
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
                  hintText: 'House Cost',
                  fillColor: const Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
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
            Wrap(spacing: 10, runSpacing: 10, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: TextCustom('Single Family'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: TextCustom('Town Home'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: TextCustom('Row Home'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: TextCustom('Condo'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: TextCustom('Duplex'),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: CustomButton(
                onPressed: () {},
                text: 'Post Referral',
              ),
            )
          ],
        ),
      ),
    );
  }
}
