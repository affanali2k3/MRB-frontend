import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/assets/us_states.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/common/dropdown.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_bloc.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_event.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';

class ReferralFiltersPage extends StatefulWidget {
  const ReferralFiltersPage({Key? key}) : super(key: key);

  @override
  ReferralFiltersPageState createState() => ReferralFiltersPageState();
}

class ReferralFiltersPageState extends State<ReferralFiltersPage> {
  ReferralFiltersPageState({Key? key});

  String state = 'Alabama';
  String city = 'Birmingham';

  final _minTimeController = TextEditingController();
  final _maxTimeController = TextEditingController();

  final _minCostController = TextEditingController();
  final _maxCostController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (GlobalVariables.preferences.state != null) {
      setState(() {
        state = GlobalVariables.preferences.state as String;
      });
    }
    if (GlobalVariables.preferences.city != null) {
      city = GlobalVariables.preferences.city as String;
      setState(() {
        city = GlobalVariables.preferences.city as String;
      });
    }

    if (GlobalVariables.preferences.minTimeAmount != null) {
      _minTimeController.text =
          GlobalVariables.preferences.minTimeAmount.toString();
    } else {
      _minTimeController.text = "0";
    }

    if (GlobalVariables.preferences.maxTimeAmount != null) {
      _maxTimeController.text =
          GlobalVariables.preferences.maxTimeAmount.toString();
    } else {
      _maxTimeController.text = "12";
    }
    if (GlobalVariables.preferences.minCost != null) {
      _minCostController.text = GlobalVariables.preferences.minCost.toString();
    } else {
      _minCostController.text = "0";
    }

    if (GlobalVariables.preferences.maxCost != null) {
      _maxCostController.text = GlobalVariables.preferences.maxCost.toString();
    } else {
      _maxCostController.text = "100000";
    }

    if (!usStatesAndCities.containsKey(state)) {
      state = "Alabama";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              filterTextField(
                  context, 'Time Span', _minTimeController, _maxTimeController),
              filterTextField(
                  context, 'Cost', _minCostController, _maxCostController),
              SizedBox(width: double.infinity, child: TextCustom('Type')),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ReferralFiltersBloc, ReferralFiltersState>(
                  builder: (context, state) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.read<ReferralFiltersBloc>().add(
                          ReferralFiltersChangeClientTypeEvent(
                              clientType: ClientType.buyer)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        decoration: BoxDecoration(
                            color: state.clientType == ClientType.buyer
                                ? const Color(0xff646464)
                                : null,
                            border: Border.all(color: const Color(0xff4B4B4B)),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextCustom('Buyer'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => context.read<ReferralFiltersBloc>().add(
                          ReferralFiltersChangeClientTypeEvent(
                              clientType: ClientType.seller)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        decoration: BoxDecoration(
                            color: state.clientType == ClientType.seller
                                ? const Color(0xff646464)
                                : null,
                            border: Border.all(color: const Color(0xff4B4B4B)),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextCustom('Seller'),
                      ),
                    ),
                  ],
                );
              }),
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
                height: 60,
              ),
            ],
          ),
        ),
        CustomButton(
            onPressed: () {
              context.read<ReferralFiltersBloc>().add(
                  ReferralFiltersApplyFilterEvent(
                      maxCost: int.parse(_maxCostController.text),
                      city: city,
                      maxTime: int.parse(_maxTimeController.text),
                      minCost: int.parse(_minCostController.text),
                      minTime: int.parse(_minTimeController.text),
                      state: state));

              Navigator.pop(context);

              context
                  .read<ReferralCentreBloc>()
                  .add(ReferralCentreLoadingEvent(city: city, state: state));
            },
            text: 'Apply Filters')
      ],
    );
  }
}

Widget typeOfHouse(BuildContext context, final String name) =>
    BlocBuilder<ReferralFiltersBloc, ReferralFiltersState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => context
            .read<ReferralFiltersBloc>()
            .add(ReferralFiltersChangeHouseTypeEvent(houseType: name)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: state.houseType == name ? const Color(0xffFCFCFC) : null,
              border: Border.all(color: const Color(0xff4B4B4B)),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            name,
            style: const TextStyle(color: Color(0xff888888)),
          ),
        ),
      );
    });

Widget filterTextField(
        BuildContext context,
        final String title,
        final TextEditingController minController,
        final TextEditingController maxController) =>
    Column(
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
                controller: minController,
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
                controller: maxController,
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
