import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/common/snack_bar.dart';

class AgentOpenFormsSentPage extends StatelessWidget {
  const AgentOpenFormsSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<AgentOpenFormsSentBloc, AgentOpenFormsSentState>(
            builder: (context, state) {
      if (state is AgentOpenFormsSentSuccessState) {
        customSnackBar(message: state.message, context: context);
      } else if (state is AgentOpenFormsSentFailedState) {
        customSnackBar(message: state.error, context: context);
      }
      if (state is AgentOpenFormsSentLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AgentOpenFormsSentSuccessState) {
        return ListView.builder(
          itemCount: state.sentForms.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sender Agent'),
                      Text(state.sentForms[index].senderAgent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client type'),
                      Text(state.sentForms[index].isBuyer ? 'Buyer' : 'Seller')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client city'),
                      Text(state.sentForms[index].city)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client state'),
                      Text(state.sentForms[index].state)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Desired date'),
                      Text(state.sentForms[index].desiredDate.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price'),
                      Text(state.sentForms[index].price.toString())
                    ],
                  ),
                  CustomOutlineButton(onPressed: () {}, text: 'Send a proposal')
                ],
              ),
            );
          },
        );
      } else {
        return Container();
      }
    }));
  }
}
