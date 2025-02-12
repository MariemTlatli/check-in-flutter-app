import 'package:flutter/material.dart';

class RegistrationCard extends StatelessWidget {
  final Map<String, dynamic> registration;

  const RegistrationCard({super.key, required this.registration});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(registration['name'] ?? 'Nom inconnu'),
        subtitle: Text("Email: ${registration['email'] ?? 'Non disponible'}"),
      ),
    );
  }
}
