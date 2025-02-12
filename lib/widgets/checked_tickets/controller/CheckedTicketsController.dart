import 'package:checkin/Api/httpClient.dart';
import 'package:checkin/widgets/checked_tickets/service/Checkedticketsservice.dart';

class CheckedTicketsController {
  final CheckedTicketsService _service = CheckedTicketsService(HttpClient());

  Future<List<Map<String, dynamic>>> fetchRegistrations() async {
    return await _service.fetchRegistrations();
  }
}
