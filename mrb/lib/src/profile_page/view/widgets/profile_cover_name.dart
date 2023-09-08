import 'package:flutter/material.dart';

class ProfileCoverNameWidget extends StatelessWidget {
  const ProfileCoverNameWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        width: double.infinity,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            ),
            const Text('Ali Makhdoom'),
            const Text('@ali_Mak')
          ],
        ),
      );
}
