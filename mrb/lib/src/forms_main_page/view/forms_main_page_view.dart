import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_forms_received/view/agent_forms_received_view.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_open_forms_sent/view/agent_forms_received_view.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_bloc.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_event.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/view/direct_forms_received_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

enum FormsMainPageTabs { proposalsReceived, proposalsSent, directFormsReceived }

class FormsMainPage extends StatefulWidget {
  const FormsMainPage({Key? key}) : super(key: key);

  @override
  FormsMainPageState createState() => FormsMainPageState();
}

class FormsMainPageState extends State<FormsMainPage> {
  FormsMainPageState({Key? key});

  FormsMainPageTabs tab = FormsMainPageTabs.proposalsReceived;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // CustomTopBarWidget(
                //   height: 200,
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        profileTabItem(
                          context,
                          'Proposals Received',
                          active: tab == FormsMainPageTabs.proposalsReceived,
                          onTap: () {
                            setState(() {
                              tab = FormsMainPageTabs.proposalsReceived;
                            });
                            context
                                .read<AgentFormsReceivedBloc>()
                                .add(AgentFormsReceivedLoadingEvent());
                          },
                        ),
                        profileTabItem(
                          context,
                          'Proposals Sent',
                          active: tab == FormsMainPageTabs.proposalsSent,
                          onTap: () {
                            setState(() {
                              tab = FormsMainPageTabs.proposalsSent;
                            });
                            context.read<AgentOpenFormsSentBloc>().add(
                                AgentOpenFormsSentLoadingEvent(
                                    userId: GlobalVariables.user.id));
                          },
                        ),
                        profileTabItem(
                          context,
                          'Forms Received',
                          active: tab == FormsMainPageTabs.directFormsReceived,
                          onTap: () {
                            setState(() {
                              tab = FormsMainPageTabs.directFormsReceived;
                            });
                            context
                                .read<DirectFormsReceivedBloc>()
                                .add(DirectFormsReceivedLoadingEvent());
                          },
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (tab == FormsMainPageTabs.proposalsReceived)
                  const AgentFormsReceivedPage(),
                if (tab == FormsMainPageTabs.proposalsSent)
                  const AgentOpenFormsSentPage(),
                if (tab == FormsMainPageTabs.directFormsReceived)
                  const DirectFormsReceivedPage()
              ],
            ),
          )),
    );
  }
}

Widget profileTabItem(BuildContext context, String text,
        {void Function()? onTap, required bool active}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: active ? CustomTheme.primaryColor : null,
            border: Border.all(
                color: active ? CustomTheme.primaryColor : Colors.white),
            borderRadius: BorderRadius.circular(6)),
        child: TextCustom(text),
      ),
    );
