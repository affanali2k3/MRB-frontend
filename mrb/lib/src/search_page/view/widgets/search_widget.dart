import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/bloc/search_page_event.dart';
import 'package:mrb/themes/font_theme.dart';

class SearchPageSearchWidget extends StatelessWidget {
  SearchPageSearchWidget({Key? key}) : super(key: key);

  final _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: CustomTheme.nightSecondaryFontColor),
      onSubmitted: (String value) => context
          .read<SearchPageBloc>()
          .add(SearchPageSearchEvent(searchQuery: value)),
      controller: _searchBarController,
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle:
              const TextStyle(color: CustomTheme.nightSecondaryFontColor),
          filled: true,
          fillColor: CustomTheme.nightTertiaryColor,
          prefixIcon:
              Image.asset('assets/icons/referral_centre/magnifier_dark.png'),
          suffixIcon: IconButton(
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
            icon: Image.asset('assets/icons/referral_centre/filter.png'),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
