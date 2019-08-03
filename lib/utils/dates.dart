import 'package:intl/intl.dart';

class CustomDate {
  final String epocTime;

  CustomDate(this.epocTime);

  String toAmericanDateTime() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(epocTime));
    return DateFormat("yyyy-MM-dd 'at' HH:mm:ss").format(date);
  }
}
