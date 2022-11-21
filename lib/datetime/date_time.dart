// returns heutiges datum formatiert als yyyymmdd
String todaysDateFormatted() {
  // heute
  var dateTimeObject = DateTime.now();

  // jahr im format yyyy
  String year = dateTimeObject.year.toString();

  // monat im format mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // tag im format dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // finales format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// convert string yyyymmdd zu DateTime objekt
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// convert datetime objekte zu String yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // Jahres format in yyyy
  String year = dateTime.year.toString();

  // Monat format in mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // TAges format in dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // finales format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
