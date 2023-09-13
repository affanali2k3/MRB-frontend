import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/top_bar_secondary_widget.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/bloc/search_page_state.dart';
import 'package:mrb/src/search_page/view/widgets/search_agents_widget.dart';
import 'package:mrb/src/search_page/view/widgets/search_widget.dart';
import 'package:mrb/src/search_page/view/widgets/selector_widget.dart';
import 'package:mrb/themes/font_theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      appBar: const CustomTopBarSecondaryWidget(title: 'Explore'),
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SearchPageSearchWidget(),
                  const SizedBox(height: 20),
                  const SearchPageSelectorWidget(),
                  const SizedBox(height: 20),
                  if (state is SearchPageAgentSearchState)
                    const SearchPageSearchAgentsWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
