import 'dart:convert';
import 'package:checkin/Api/httpClient.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CheckedTicketsService {
  final HttpClient api;
  CheckedTicketsService(this.api);

  Future<List<Map<String, dynamic>>> fetchRegistrations() async {
    try {
      final response = await api.get(
        "registration",
      );
      return List<Map<String, dynamic>>.from(response["data"]);
    } catch (e) {
      debugPrint("Erreur lors de la récupération des inscriptions: $e");
      throw Exception(
          "Impossible de récupérer les inscriptions. ${e.toString()} ");
    }
  }
}
