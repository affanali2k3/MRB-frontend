import 'package:flutter/material.dart';
import 'package:mrb/src/referral_filters/view/referral_filters_view.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentreSearchWidget extends StatelessWidget {
  const ReferralCentreSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          hintText: 'Search here',
          hintStyle:
              const TextStyle(color: CustomTheme.nightSecondaryFontColor),
          filled: true,
          fillColor: CustomTheme.nightTertiaryColor,
          prefixIcon: Image.asset('assets/icons/referral_centre/search.png'),
          suffixIcon: IconButton(
            onPressed: () {
              showModalBottomSheet<dynamic>(
                  backgroundColor: CustomTheme.nightBackgroundColor,
                  context: context,
                  builder: (context) => const ReferralFiltersPage());
            },
            icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CustomTheme.primaryColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Image.asset('assets/icons/referral_centre/filters.png')),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
