import 'package:flutter/material.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomTopBarSecondaryWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomTopBarSecondaryWidget({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomTheme.nightAppbarColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
      title: Text(title),
      centerTitle: true,
    );
  }
}
