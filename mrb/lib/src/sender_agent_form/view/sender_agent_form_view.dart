import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/dropdown.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/common/snack_bar.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_bloc.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_event.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class SenderAgentFormPage extends StatelessWidget {
  SenderAgentFormPage({super.key});

  final _receiverAgentEmailController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SenderAgentFormBloc, SenderAgentFormState>(
          builder: (context, state) {
        if (state is SenderAgentFormSuccessState) {
          customSnackBar(message: state.message, context: context);
        }
        if (state is SenderAgentFormFailedState) {
          customSnackBar(message: state.error, context: context);
        }
        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Column(children: [
            CustomTextField(controller: _cityController, hintText: 'City'),
            CustomTextField(controller: _stateController, hintText: 'State'),
            CustomDropDown(
              defaultSelectedOption: state.userType.name,
              items: [UserType.buyer.name, UserType.seller.name],
              onChanged: (val) {
                print(val);
                context.read<SenderAgentFormBloc>().add(
                    SenderAgentFormChangeIsBuyerEvent(
                        userType: val == UserType.buyer.name
                            ? UserType.buyer
                            : UserType.seller));
              },
            ),
            CustomTextField(
                controller: _priceController, hintText: 'Approximate price'),
            CustomOutlineButton(
                primary: false,
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 400)))
                      .then((date) {
                    if (date == null) return;
                    return context.read<SenderAgentFormBloc>().add(
                        SenderAgentFormChangeDesiredDateEvent(
                            desiredDate: date));
                  });
                },
                text: state.userType == UserType.buyer
                    ? 'Date of purchasing'
                    : 'Date of selling'),
            Checkbox(
                value: state.formType == FormType.open,
                onChanged: (e) {
                  context.read<SenderAgentFormBloc>().add(
                      SenderAgentFormChangeFormTypeEvent(
                          formType: state.formType == FormType.direct
                              ? FormType.open
                              : FormType.direct));
                }),
            SizedBox(
                child: state.formType == FormType.open
                    ? null
                    : CustomTextField(
                        controller: _receiverAgentEmailController,
                        hintText: 'Receiver agent')),
            CustomOutlineButton(
                onPressed: () => context.read<SenderAgentFormBloc>().add(
                    SenderAgentFormSubmitEvent(
                        city: _cityController.text,
                        state: _stateController.text,
                        receiverAgent: _receiverAgentEmailController.text,
                        price: _priceController.text)),
                text: 'Submit')
          ]),
        );
      }),
    );
  }
}
