import 'package:intl/intl.dart';

/// Asosiy kerak bo'ladigan funktsiyalarni saqlash uchun
class BaseUtils {
  static String formatDateWithTime(String date) {
    return DateFormat("MMM d yyyy HH:mm:ss").format(DateTime.tryParse(date));
  }
}