import 'package:screpagram/core/theme/color_theme.dart';
import 'package:screpagram/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsOptionsWidget extends StatelessWidget {
  final String AID;
  final bool urlStatus;
  const SettingsOptionsWidget({
    super.key,
    required this.AID,
    required this.urlStatus,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> settings = Constants.settingsOptions.entries
        .map((e) => {'title': e.key, 'icon': e.value})
        .toList();

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: settings.length,
      itemBuilder: (context, index) {
        final currentSetting = settings[index];

        return ListTile(
          leading: currentSetting['icon'],
          title: Text(
            currentSetting['title'],
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: currentSetting['title'] == 'Log Out'
                      ? TColorTheme.red
                      : TColorTheme.textGrey,
                ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
