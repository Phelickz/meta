import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/existing_account_tile.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class ExistingAccountView extends StackedView<ManageAccountViewModel>{
  const ExistingAccountView({super.key});

  @override
  Widget builder(BuildContext context, ManageAccountViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Skeleton(
      isBusy: viewModel.isBusy, 
      appBar: existingAccountAppbar(context, "Search Brokers", "Find a broker"),
      body: SafeArea(
        child: Column(
          children: [
            const ExistingAppBarExtension(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.pWidth(context)),
                child: ListView.builder(
                  itemCount: viewModel.existingAccount.length,
                  itemBuilder: (context, index){
                    return ExistingAccountTile(brokerLogoPath: viewModel.existingAccount[index]["brokerLogoPath"], title: viewModel.existingAccount[index]["title"], subtitle: viewModel.existingAccount[index]["subtile"]);
                  }
                )
              ),
            ),
          ],
        )
      )
    );
  }

  @override
  ManageAccountViewModel viewModelBuilder(BuildContext context) {
    return ManageAccountViewModel();
  }
}