import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/input_field.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_filters/view/referral_filters_view.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentreSearchWidget extends StatelessWidget {
  const ReferralCentreSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Search leads',
          hintStyle:
              const TextStyle(color: CustomTheme.nightSecondaryFontColor),
          filled: true,
          fillColor: CustomTheme.nightTertiaryColor,
          prefixIcon:
              Image.asset('assets/icons/referral_centre/magnifier_dark.png'),
          suffixIcon: IconButton(
            onPressed: () {
              showModalBottomSheet<dynamic>(
                  backgroundColor: CustomTheme.nightBackgroundColor,
                  context: context,
                  builder: (context) => const ReferralFiltersPage());
            },
            icon: Image.asset('assets/icons/referral_centre/filter.png'),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
