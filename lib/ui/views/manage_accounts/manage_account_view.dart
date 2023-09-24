import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/account_tile.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_account_bottomsheet.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class ManageAccountView extends StackedView<ManageAccountViewModel> {
  const ManageAccountView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ManageAccountViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      appBar: maanageAccountAppBar(context, viewModel),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (context) {
                      return ManageAccountBottomSheet1(
                        accountDetail: "44291097-Deriv-Real",
                        model: viewModel,
                      );
                    });
              },
              child: const ManageAppbarExtension(),
            ),
            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 15.pWidth(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 160.pHeight(context),
                  ),
                  Text(
                    "Connect to",
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.2),
                        color: CustomThemeData.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16.pHeight(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: viewModel.brokers_list.length,
                        // padding: EdgeInsets.symmetric(horizontal: 15.pWidth(context),),
                        itemBuilder: (context, index) {
                          return AccountTile(
                              model: viewModel,
                              type: viewModel.brokers_list[index]["type"],
                              email: viewModel.brokers_list[index]["email"],
                              brokerLogoPath: viewModel.brokers_list[index]
                                  ["brokerImage"],
                              details: viewModel.brokers_list[index]["details"],
                              amount: viewModel.brokers_list[index]["Balance"]);
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  ManageAccountViewModel viewModelBuilder(BuildContext context) =>
      ManageAccountViewModel();
}
