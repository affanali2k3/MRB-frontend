abstract class ReferralPostEvent {}

final class ReferralPostChangeIsBuyerEvent extends ReferralPostEvent {
  ReferralPostChangeIsBuyerEvent({required this.isBuyer});
  final bool isBuyer;
}

final class ReferralPostChangeHouseTypeEvent extends ReferralPostEvent {
  ReferralPostChangeHouseTypeEvent({required this.houseType});
  final String houseType;
}
