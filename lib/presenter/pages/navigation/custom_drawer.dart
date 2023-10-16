import 'package:Akash/config/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/helper/constants.dart';
import '../../../di/injection_container.dart';
import '../../helper/common_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonWidget commonWidget = sl.get<CommonWidget>();
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: sl.get<CustomColors>().navDrawableBG,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 115.0, // Set the height of the header
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  // Adjust the radius as needed
                  bottomRight:
                      Radius.circular(60.0), // Adjust the radius as needed
                ),
                child: DrawerHeader(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  // Reduce space from the bottom of the header
                  decoration: BoxDecoration(
                    color: const Color(0x4CFFFFFF).withOpacity(
                        0.31), // Set color to #FFFFFF with opacity 31%
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 56.0, // Set width
                        height: 56.0, // Set height
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? Colors.blue
                                  : Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            "U",
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      // Add some spacing between the avatar and the text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'User Name',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                            ),
                          ),
                          Text(
                            'Subscriber ID: 1026589555',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Your added content below the header
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0, // Adjust the top padding as needed
                left: 10.0,
                right: 10.0,
                bottom: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // Align based on text baseline
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        // Add right padding for spacing
                        child: Text(
                          '৳ 30.50',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                            ),
                        ),
                      ),
                      Text(
                        'Monthly Recharge: ৳154',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                          ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account Balance',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Add vertical spacing between the two Text widgets
                          Text(
                            'Expired on: 02 Jul\'23',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50.0),
                      // Add the desired space between Column and Container
                      Container(
                        width: 109.0,
                        height: 27.0,
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 16.0,
                                    // Adjust the width as needed for the circle
                                    height: 16.0,
                                    // Adjust the height as needed for the circle
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEB2F8D), // Circle color
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '৳',
                                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                          color: sl.get<CustomColors>().hexToColor(sideMenuTextColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Recharge',
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: sl.get<CustomColors>().hexToColor(rechargeTextColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity, // Make the divider span from start to end
              height: 0.2, // Adjust the height as needed
              color: Colors.white, // White color for the divider
            ),

            commonWidget.listViewItem(
                context,
                'assets/image/subscriptiondetails.png',
                'Subscription Details',
                actionTypeSubscriptionDetails, onClickEvent),

            commonWidget.listViewItem(context, 'assets/image/newsandevents.png',
                'News and Events', actionTypeNewsAndEvents, onClickEvent),

            commonWidget.listViewItem(
                context,
                'assets/image/subscriptioncalculator.png',
                'Subscription Calculator',
                actionTypeSubscriptionCalculator, onClickEvent),

            commonWidget.listViewItem(
                context,
                'assets/image/loyaltyprogram.png',
                'Loyalty Program',
                actionTypeLoyaltyProgram, onClickEvent),

            commonWidget.listViewItem(context, 'assets/image/aboutakash.png',
                'About Akash', actionTypeAboutAkash, onClickEvent),

            commonWidget.listViewItem(context, 'assets/image/settings.png',
                'Settings', actionTypeSettings, onClickEvent),

            commonWidget.listViewItem(
                context,
                'assets/image/Iconawesomehandshelping.png',
                'Help and Support',
                actionTypeHelp, onClickEvent),

            commonWidget.listViewItem(
                context,
                'assets/image/termsandconditions.png',
                'Terms and Conditions',
                actionTypeTerms, onClickEvent),

            commonWidget.listViewItem(context, 'assets/image/privacypolicy.png',
                'Privacy Policy', actionTypePrivacy, onClickEvent),

            commonWidget.setSideMenuTermsAndConditions(context),
          ],
        ),
      ),
    );
  }

  void onClickEvent(BuildContext context, String actionType) {
    switch (actionType) {
      case actionTypeSubscriptionDetails:
        context.pop();
        break;
      case actionTypeNewsAndEvents:
        context.pop();
        break;
      case actionTypeSubscriptionCalculator:
        context.pop();
        break;
      case actionTypeLoyaltyProgram:
        context.pop();
        break;
      case actionTypeAboutAkash:
        context.pop();
        break;
      case actionTypeSettings:
        context.pop();
        break;
      case actionTypeHelp:
        context.pop();
        break;
      case actionTypeTerms:
        context.pop();
        break;
      case actionTypePrivacy:
        context.pop();
        break;
    }
  }
}
