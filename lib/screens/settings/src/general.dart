import 'package:flutter/material.dart';

class GeneralSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettingsWidget(
            settingTitle: 'App Name',
            currentValue: 'Tea Management Portal',
          ),
          SettingsWidget(
            settingTitle: 'Language',
            currentValue: 'English',
          ),
          SettingsWidget(
              settingTitle: 'Time Zone', currentValue: '+03:00 Nairobi')
        ],
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  final String settingTitle;
  final String currentValue;
  const SettingsWidget({
    Key key,
    @required this.settingTitle,
    @required this.currentValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  settingTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  currentValue,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 12.0),
                ),
              ],
            ),
            Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
