import 'package:meta_trader/app/core/custom_base_view_model.dart';

enum LoyaltyRewardsViewEnum { base, about }

class LoyaltyRewardsViewModel extends CustomBaseViewModel {
  LoyaltyRewardsViewEnum _loyaltyRewardsViewEnum = LoyaltyRewardsViewEnum.base;
  LoyaltyRewardsViewEnum get loyaltyRewardsViewEnum => _loyaltyRewardsViewEnum;

  bool _viewDailyRewards = false;
  bool get viewDailyRewards => _viewDailyRewards;

  set setLoyaltyRewardsViewEnum(LoyaltyRewardsViewEnum e) {
    _loyaltyRewardsViewEnum = e;
    rebuildUi();
  }

  set setViewDailyRewards(bool val) {
    _viewDailyRewards = val;
    rebuildUi();
  }
}
