import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/security/security_view_model.dart';
import 'device_tile.dart';

class DevicesPage extends StatelessWidget {
  final SecurityViewModel model;
  const DevicesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    List<DeviceModel> devices = [
      DeviceModel(
          name: "iPhone xR",
          ip: "192.210.78.72",
          location: "New Jersey, USA ",
          date: "2023.7.13 20:40:08"),
      DeviceModel(
          name: "iPhone xR",
          ip: "192.210.78.72",
          location: "New Jersey, USA ",
          date: "2023.7.13 20:40:08"),
    ];
    return Column(
      children: [
        verticalSpaceXSmall(context),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => DeviceTile(
              device: devices[index],
              viewModel: model,
            ),
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpaceXXSmall(context);
            },
          ),
        ),
      ],
    );
  }
}
