import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_centre/view/widgets/lead_display_widget.dart';
import 'package:mrb/src/referral_centre/view/widgets/search_widget.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentrePage extends StatelessWidget {
  const ReferralCentrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ReferralCentreBloc>().add(ReferralCentreLoadingEvent(
              city: 'Los Angeles', state: 'California'));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            minimum: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTopBarWidget(),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('Referral Centre', fontSize: 30)),
                const SizedBox(
                  height: 20,
                ),
                const ReferralCentreSearchWidget(),
                const SizedBox(
                  height: 20,
                ),
                const ReferralCentreLeadDisplayWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
