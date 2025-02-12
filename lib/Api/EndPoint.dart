class EndPoint {
  static const String baseUrl = "http://localhost:3001/api/v1";
  // static const String baseUrl = 'http://192.168.31.1:4500';
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiaG1kNWlkZW1pdCIsImlhdCI6MTczOTAwNjI0NX0.c0PlVESmeORinVRy-JPBB6JEW4qMGfe1-ynzHV7ysZc";
  static const int timeoutDuration = 15; // Timeout duration in seconds

  static const String getallAttendees = 'api/attendees/all';
  static const String getcheckedticket = 'api/attendees/checked';
  static const String checkbycodeticket = 'api/attendees/checkbycodeticket';
  static const String checkinguest = 'api/attendees/checkinguest';
}
