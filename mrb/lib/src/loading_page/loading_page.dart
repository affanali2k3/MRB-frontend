import 'package:flutter/material.dart';
import 'package:mrb/src/common/top_bar_secondary_widget.dart';

import 'package:mrb/themes/font_theme.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        appBar: CustomTopBarSecondaryWidget(title: 'Loading'),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Loading...",
                style: TextStyle(color: CustomTheme.nightSecondaryFontColor),
              )
            ],
          ),
        ));
  }
}
