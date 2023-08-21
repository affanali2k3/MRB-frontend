import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/common/snack_bar.dart';

class AgentFormsReceivedPage extends StatelessWidget {
  const AgentFormsReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<AgentFormsReceivedBloc, AgentFormsReceivedState>(
            builder: (context, state) {
      if (state is AgentFormsReceivedSucessState) {
        customSnackBar(message: state.message, context: context);
      } else if (state is AgentFormsReceivedFailedState) {
        customSnackBar(message: state.error, context: context);
      }
      if (state is AgentFormsReceivedLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AgentFormsReceivedSucessState) {
        return ListView.builder(
          itemCount: state.receivedForms.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sender Agent'),
                      Text(state.receivedForms[index].senderAgent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client type'),
                      Text(state.receivedForms[index].isBuyer
                          ? 'Buyer'
                          : 'Seller')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client city'),
                      Text(state.receivedForms[index].city)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Client state'),
                      Text(state.receivedForms[index].state)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Desired date'),
                      Text(state.receivedForms[index].desiredDate.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price'),
                      Text(state.receivedForms[index].price.toString())
                    ],
                  ),
                  CustomOutlineButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            final proposalController = TextEditingController();
                            return AlertDialog(
                              content: SizedBox(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: proposalController,
                                      decoration: const InputDecoration(
                                          hintText: 'Write your proposal here',
                                          border: OutlineInputBorder()),
                                      maxLines: 5,
                                    ),
                                    CustomOutlineButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          context
                                              .read<AgentFormsReceivedBloc>()
                                              .add(AgentFormsSendProposalEvent(
                                                  senderAgentFormId: state
                                                      .receivedForms[index].id,
                                                  proposal:
                                                      proposalController.text));
                                        },
                                        text: 'Send')
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'Send proposal')
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
