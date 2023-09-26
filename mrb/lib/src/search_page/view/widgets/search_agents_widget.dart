import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/agent_widget.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/bloc/search_page_state.dart';

class SearchPageSearchAgentsWidget extends StatelessWidget {
  const SearchPageSearchAgentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
      if (state is SearchPageAgentSearchState) {
        return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: state.agents.length,
            itemBuilder: (context, index) =>
                CustomAgentWidget(agent: state.agents[index]));
      } else {
        return const SizedBox();
      }
    });
  }
}
