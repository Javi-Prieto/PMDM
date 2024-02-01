import 'package:flutter/material.dart';
import 'package:tmdb/models/account_details_response/account_details_response.dart';

class AccountDetailsItem extends StatelessWidget {
  const AccountDetailsItem({super.key, required this.account});
  final AccountDetailsResponse account;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        account.username!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 65,
        ),
      ),
    );
  }
}
