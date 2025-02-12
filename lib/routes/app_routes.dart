import 'package:checkin/main.dart';
import 'package:checkin/widgets/HomePage/HomePage.dart';
import 'package:checkin/widgets/Scan_Page/view/ScanPage.dart';
import 'package:checkin/widgets/attendees_screen/invitationsPage.dart';
import 'package:checkin/widgets/ticket_page/view/ticketPage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String scan = '/scan';
  static const String ticket = '/ticket';
  static const String invitations = '/invitations';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case scan:
        return MaterialPageRoute(builder: (_) => const Scanner_screen());
      case ticket:
        return MaterialPageRoute(builder: (_) => MyTicketView());
      case invitations:
        return MaterialPageRoute(builder: (_) => const Invitations());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
