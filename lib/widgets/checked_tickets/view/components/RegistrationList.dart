import 'package:checkin/widgets/checked_tickets/view/components/RegistrationCard.dart';
import 'package:flutter/material.dart';

class RegistrationList extends StatelessWidget {
  final List<Map<String, dynamic>> registrations;

  const RegistrationList({super.key, required this.registrations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registrations.length,
      itemBuilder: (context, index) {
        return RegistrationCard(registration: registrations[index]);
      },
    );
  }
}
