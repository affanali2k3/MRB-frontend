import 'package:flutter/material.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';

class SearchPageSelectorWidget extends StatelessWidget {
  const SearchPageSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white)),
          child: TextCustom('Agents'),
        )
      ],
    );
  }
}
