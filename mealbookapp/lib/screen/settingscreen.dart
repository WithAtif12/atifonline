import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mealbookapp/screen/Addrecipescreen.dart';
import 'package:mealbookapp/widgets/setting/settingHeader.dart';
import 'package:mealbookapp/widgets/setting/settingMenu.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Account Settings
            const SectionHeading(title: 'Account Settings', showActionButton: false),
            SettingsMenuTile(
              icon: Iconsax.safe_home,
              title: 'My Addresses',
              subTitle: 'Set shopping delivery address',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.shopping_cart,
              title: 'My Cart',
              subTitle: 'Add, remove products and move to checkout',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.bag_tick,
              title: 'My Orders',
              subTitle: 'In-progress and Completed Orders',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.bank,
              title: 'Bank Account',
              subTitle: 'Withdraw balance to registered bank account',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.discount_shape,
              title: 'My Coupons',
              subTitle: 'List of all the discounted coupons',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.notification,
              title: 'Notifications',
              subTitle: 'Set any kind of notification message',
              onTap: () {},
            ),
            SettingsMenuTile(
              icon: Iconsax.security_card,
              title: 'Account Privacy',
              subTitle: 'Manage data usage and connected accounts',
              onTap: () {},
            ),

            // App Settings
            const SectionHeading(title: 'App Settings', showActionButton: false),
            SettingsMenuTile(
              icon: Iconsax.document_upload,
              title: 'Load Data',
              subTitle: 'Upload Data to your Cloud Firebase',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Addrecipescreen()));
              },
            ),
            SettingsMenuTile(
              icon: Iconsax.location,
              title: 'Geolocation',
              subTitle: 'Set recommendation based on location',
              trailing: const Switch(value: true, onChanged: null),
            ),
            SettingsMenuTile(
              icon: Iconsax.image,
              title: 'HD Image Quality',
              subTitle: 'Set image quality to be seen',
              trailing: const Switch(value: false, onChanged: null),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
