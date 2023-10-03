import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/assets/us_states.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/dropdown.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_bloc.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_event.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_state.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_bloc.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_event.dart';
import 'package:mrb/src/referral_post_direct/view/referral_post_direct_view.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralPostPage extends StatefulWidget {
  const ReferralPostPage({Key? key}) : super(key: key);

  @override
  ReferralPostViewState createState() => ReferralPostViewState();
}

class ReferralPostViewState extends State<ReferralPostPage> {
  ReferralPostViewState({Key? key});

  final _leadDetailsController = TextEditingController();
  final _costController = TextEditingController();
  final _timelineController = TextEditingController();

  bool isBuyer = true;
  String state = 'Alabama';
  String city = 'Birmingham';
  String houseType = HouseTypes.singleFamily;
  FormType formType = FormType.open;

  void updateFormType(String newhouseType) {
    setState(() {
      houseType = newhouseType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  width: 130,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffE2E2E2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Image.asset('assets/icons/referral_centre/public.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 20,
                          child: CustomDropDown(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              defaultSelectedOption: 'Public',
                              items: const ['Public', 'Private'],
                              onChanged: (val) {
                                if (val == null) return;

                                setState(() {
                                  formType = val == 'Public'
                                      ? FormType.open
                                      : FormType.direct;
                                });
                              }),
                        ),
                        Text(formType == FormType.open ? 'Public' : 'Private')
                      ],
                    ),
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
                  onTap: () => setState(() {
                    isBuyer = true;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: isBuyer ? CustomTheme.primaryColor : null,
                        border: Border.all(
                            color: isBuyer
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
                  onTap: () => setState(() {
                    isBuyer = false;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: isBuyer ? null : CustomTheme.primaryColor,
                        border: Border.all(
                            color: isBuyer
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
            Wrap(spacing: 10, runSpacing: 10, children: [
              ReferralPostHouseTypeWidget(
                houseType: HouseTypes.singleFamily,
                selectedHouseType: houseType,
                onHouseTypeSelected: updateFormType,
              ),
              ReferralPostHouseTypeWidget(
                houseType: HouseTypes.townHome,
                onHouseTypeSelected: updateFormType,
                selectedHouseType: houseType,
              ),
              ReferralPostHouseTypeWidget(
                houseType: HouseTypes.rowHome,
                onHouseTypeSelected: updateFormType,
                selectedHouseType: houseType,
              ),
              ReferralPostHouseTypeWidget(
                houseType: HouseTypes.condo,
                onHouseTypeSelected: updateFormType,
                selectedHouseType: houseType,
              ),
              ReferralPostHouseTypeWidget(
                houseType: HouseTypes.duplex,
                onHouseTypeSelected: updateFormType,
                selectedHouseType: houseType,
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
            CustomDropDown(
                defaultSelectedOption: state,
                items: usStates,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      state = value;
                      city = usStatesAndCities[state]!.first;
                    });
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: TextCustom('City', fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
                defaultSelectedOption: city,
                items: usStatesAndCities[state]!,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      city = value;
                    });
                  }
                }),
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
              controller: _costController,
              decoration: InputDecoration(
                  prefix: const Text('\$'),
                  filled: true,
                  hintText: 'House Cost For ${isBuyer ? 'Buying' : 'Selling'}',
                  fillColor: const Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: TextCustom('Timeline to purchase', fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _timelineController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  filled: true,
                  hintText:
                      'Number of months for ${isBuyer ? 'Buying' : 'Selling'}',
                  fillColor: const Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _leadDetailsController,
              maxLines: 10,
              maxLength: 200,
              style: const TextStyle(color: Color(0xffB8B8B8)),
              decoration: InputDecoration(
                  // counterText: ,c
                  counterStyle: const TextStyle(color: Color(0xffB8B8B8)),
                  hintText: 'Details about the lead...',
                  hintStyle: const TextStyle(
                      color: CustomTheme.nightSecondaryFontColor),
                  filled: true,
                  fillColor: CustomTheme.nightAppbarColor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            formType == FormType.direct
                ? CustomButton(
                    onPressed: () {
                      context.read<ReferralPostDirectBloc>().add(
                          ReferralPostDirectTopAgentsLoadingEvent(
                              state: state,
                              clientType: isBuyer
                                  ? ClientType.buyer
                                  : ClientType.seller));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReferralPostDirectPage(
                              city: city,
                              desiredAt: DateTime.now(),
                              price: double.parse(_costController.text),
                              clientState: state,
                              clientType: isBuyer
                                  ? ClientType.buyer
                                  : ClientType.seller,
                            ),
                          ));
                    },
                    text: 'Share with agents',
                  )
                : CustomButton(
                    onPressed: () {
                      context.read<ReferralPostBloc>().add(
                          ReferralPostOpenFormPostEvent(
                              city: city,
                              state: state,
                              isBuyer: isBuyer,
                              formType: formType,
                              houseType: houseType,
                              price: double.parse(_costController.text),
                              timeAmount: int.parse(_timelineController.text)));
                      Navigator.pop(context);
                    },
                    text: 'Post Publicly',
                  ),
          ],
        ),
      ),
    );
  }
}

class ReferralPostHouseTypeWidget extends StatelessWidget {
  const ReferralPostHouseTypeWidget(
      {Key? key,
      required this.houseType,
      required this.selectedHouseType,
      required this.onHouseTypeSelected})
      : super(key: key);

  final String houseType;
  final String selectedHouseType;
  final void Function(String) onHouseTypeSelected; // Callback function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onHouseTypeSelected(houseType);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: selectedHouseType == houseType
                ? CustomTheme.primaryColor
                : null,
            border: Border.all(
                color: selectedHouseType == houseType
                    ? CustomTheme.primaryColor
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: TextCustom(houseType),
      ),
    );
  }
}
