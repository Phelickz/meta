import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/p_graph.dart';
import 'package:meta_trader/ui/widgets/provider/components/p_graph2.dart';
import 'package:meta_trader/ui/widgets/provider/components/profile_bar.dart';
import 'package:meta_trader/ui/widgets/provider/components/psummary.dart';
import 'package:meta_trader/ui/widgets/provider/components/psummary2.dart';
import 'package:meta_trader/ui/widgets/provider/provider_trade_history.dart';

class ProviderDashboardPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderDashboardPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
     return ValueListenableBuilder<int>(
      valueListenable: viewModel.overviewTabSelectedNotifier,
       builder: (context, index, _) {
         return IndexedStack(
          index: index,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 8.pHeight(context),),
                  // ProfileBar(name: "Adenuga Kolade", job: "Flutter Developer", nationality: "NGR"),
                  SizedBox(height: 16.pHeight(context),),
                  Psummary(viewModel: viewModel),
                  SizedBox(height: 24.pHeight(context),),
                  Psummary2(viewModel: viewModel),
                  SizedBox(height: 24.pHeight(context),),
                  PGraph(viewModel: viewModel),
                  SizedBox(height: 24.pHeight(context),),
                  PGraph2(viewModel: viewModel),
                  SizedBox(height: 24.pHeight(context),)
                ],
              ),
            ),
            PTradeHistory(viewModel: viewModel)
          ],
         );
       }
     );
  }

}