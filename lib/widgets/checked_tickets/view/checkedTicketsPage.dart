import 'package:checkin/widgets/checked_tickets/controller/CheckedTicketsController.dart';
import 'package:checkin/widgets/checked_tickets/view/components/RegistrationList.dart';
import 'package:flutter/material.dart';

class CheckedTicketsPage extends StatefulWidget {
  const CheckedTicketsPage({super.key});

  @override
  _CheckedTicketsPageState createState() => _CheckedTicketsPageState();
}

class _CheckedTicketsPageState extends State<CheckedTicketsPage> {
  final CheckedTicketsController _controller = CheckedTicketsController();
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredRegistrations = [];
  void _filterRegistrations(String query) async {
    if (query.isEmpty) {
      _filteredRegistrations = [];
    } else {
      final registrations = await _controller.fetchRegistrations();
      _filteredRegistrations = registrations.where((registration) {
        return registration['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Liste des inscriptions'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Rechercher une inscription...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    // Filtrer les inscriptions en fonction de la recherche
                    _filterRegistrations(value);
                  });
                },
              ),
            ),
          ),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _controller.fetchRegistrations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erreur : ${snapshot.error}',
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  "Aucune inscription disponible",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            // Utilise les inscriptions filtrées ou toutes les inscriptions si aucune recherche
            _filteredRegistrations = _searchController.text.isEmpty
                ? snapshot.data!
                : _filteredRegistrations;

            return RegistrationList(registrations: _filteredRegistrations);
          },
        ),
      ),
    );
  }
}
