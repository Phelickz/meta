import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class ProviderView extends StackedView<ProviderViewModel>{
  const ProviderView({super.key});

  @override
  Widget builder(BuildContext context, ProviderViewModel viewModel, Widget? child) {
    return Skeleton(
      isBusy: viewModel.isBusy, 
      bodyPadding: EdgeInsets.symmetric(horizontal: 24.pWidth(context)),
      appBar: viewModel.returnAppBar(context),
      body: SafeArea(child: viewModel.returnPage())
    );
  }

  @override
  ProviderViewModel viewModelBuilder(BuildContext context) {
    return ProviderViewModel();
  }
  
}