import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/top_bar_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_centre/view/widgets/lead_display_widget.dart';
import 'package:mrb/themes/font_theme.dart';

class ReferralCentrePage extends StatelessWidget {
  ReferralCentrePage({Key? key, required this.mainPageScaffoldKey})
      : super(key: key);

  final mainPageScaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      appBar: CustomTopBarWidget(
        height: 180,
        mainPageScaffoldKey: mainPageScaffoldKey,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ReferralCentreBloc>().add(ReferralCentreLoadingEvent(
              city: 'Los Angeles', state: 'California'));
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            // minimum: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                // const CustomTopBarWidget(),

                ReferralCentreLeadDisplayWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
