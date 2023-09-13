// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_bloc.dart';
// import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_state.dart';

// class SentClientReferralsPage extends StatelessWidget {
//   const SentClientReferralsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:
//         BlocBuilder<SentClientReferralsBloc, SentClientReferralsState>(
//             builder: (context, state) {
//       print(state);
//       if (state is SentClientReferralsLoadingState) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       } else if (state is SentClientReferralsDirectSuccessState) {
//         return ListView.builder(
//           itemCount: state.directReferralsSent.length,
//           itemBuilder: (context, index) {
//             return SizedBox(
//               height: 200,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Sender Agent'),
//                       Text(state.directReferralsSent[index].senderAgent)
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Client type'),
//                       Text(state.directReferralsSent[index].isBuyer
//                           ? 'Buyer'
//                           : 'Seller')
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Client city'),
//                       Text(state.directReferralsSent[index].city)
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Client state'),
//                       Text(state.directReferralsSent[index].state)
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Desired date'),
//                       Text(state.directReferralsSent[index].desiredDate
//                           .toString())
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Price'),
//                       Text(state.directReferralsSent[index].price.toString())
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       } else {
//         return Container();
//       }
//     }));
//   }
// }
