import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_state.dart';
import 'package:mrb/src/sender_agent_form/view/sender_agent_form_view.dart';

class ReferralCentrePage extends StatelessWidget {
  ReferralCentrePage({Key? key}) : super(key: key);

  final _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Referral Centre',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SenderAgentFormPage(),
                  )),
              text: 'Post a Lead',
              width: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchBarController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (String value) => null,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: CustomOutlineButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      final cityController = TextEditingController();
                      final stateController = TextEditingController();
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                                controller: stateController, hintText: 'State'),
                            CustomTextField(
                                controller: cityController, hintText: 'City'),
                            CustomOutlineButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context.read<ReferralCentreBloc>().add(
                                      ReferralCentreLoadingEvent(
                                          city: cityController.text,
                                          state: stateController.text));
                                },
                                text: 'Done')
                          ],
                        ),
                      );
                    },
                  );
                },
                text: 'Filters',
                width: 80,
                primary: false,
              ),
            ),
            BlocBuilder<ReferralCentreBloc, ReferralCentreState>(
              builder: (context, state) {
                if (state is ReferralCentreLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ReferralCentreFailedState) {
                  return Text('Error: ${state.error}');
                } else if (state is ReferralCentreSuccessState) {
                  return ListView.builder(
                    itemCount: state.leads.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: const Color.fromARGB(255, 210, 208, 208),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Client Type'),
                              Text(state.leads[index].isBuyer
                                  ? 'Buyer'
                                  : 'Seller')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('City'),
                              Text(state.leads[index].city)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('State'),
                              Text(state.leads[index].state)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Desired Date'),
                              Text(state.leads[index].desiredDate.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Approximate Price'),
                              Text('\$${state.leads[index].price}')
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
