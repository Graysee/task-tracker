import'package:intl/intl.dart';

/// this class contains validation response
class Val {

  /// Function that returns a validation message saying title cannot be empty
  static String? ValidationTitle(String? val) {
    return (val != null && val != "") ? null : "Title cannot be empty";
  }

  ///this function returns the number of days to expiry as a string
  static String? getExpiryStr(String expires){
    DateTime? expire = DateUtility.convertToDate(expires); ///this function takes the inputed time, uses the convertToDate function below to convert it to date
    var timediff = DateTime.now(); ///takes the present time and stores in a variable

    Duration diff = timediff.difference(expire!); ///records the difference between expiry time and present time in duration
    int diffdays = diff.inDays+1;  ///converts the difference to days between expiry time and present time from duration to days
    return (diffdays > 0)? diffdays.toString() : "0"; ///#returns the difference in days converted to string but returns 0 if it is less than 0
  }

  ///This function converts strings to integer, checks if it is greater than 0 then converts to true or false if below 0 depending on input
  static bool strToBool(String str) {
    return (int.parse(str)>0)? true : false;
  }

  ///This function converts integers above 0 to true and 0 to false depending on input
  static bool intToBool(int? val){
    return (val! > 0)? true : false;
  }

  ///This function converts true or false to a string 1 0r 0 depending on input
  static String? boolToString(bool val){
    return (val == true) ? "1":"0";
  }

  ///this functions converts true or false to 0 or 1 depending on the input
  static int BoolToInt(bool val){
    return (val == true) ? 1 : 0;
  }
}

class DateUtility {
   ///This function converts date to a strict 'yyyy-mm-dd' format
  static DateTime? convertToDate(String input){
    try
    {
      var date = DateFormat("yyyy-MM-dd").parseStrict(input);///converts the input strictly to the declared format
      return date; ///returns the date in our format
    }catch (e){
      return null; ///if the date entered is not in the format, it catches the error and returns nothing
    }
  }

  static String? convertToDateFull(String input){
    try
        {
          var date = DateFormat("yyyy-MM-dd").parseStrict(input);///converts the input strictly to the declared format
          var formatter = DateFormat('dd MMM yyyy'); ///introduces a variable that hold another dataformat
          return formatter.format(date); ///uses the new format to change the way the data will appear
        }catch (e){
      return null; ///if the date entered is not in the format, it catches the error and returns nothing
    }
  }

  static String? convertToDateFullDT(DateTime input){ ///converts the input to a standard datetime
    try
    {
      var formatter = DateFormat('dd MMM yyyy'); ///introduces a variable that hold another data format
      return formatter.format(input); ///uses the new format to change the way the data will appear
    }catch (e){
      return null; ///if the date entered is not in the format, it catches the error and returns nothing
    }
  }

  ///this function checks if the date passed is in the right format and returns true, else catches the error and returns false
  static bool isDate(String dt){
    try
    {
    var data = DateFormat("yyyy-MM-dd").parseStrict(dt);
    return true;
    } catch(e){
      return false;
    }
  }
  static bool isValidDate(String dt){
    if (dt.isEmpty || !dt.contains("-") || dt.length < 10)  return false;/// if the date is empty or contains - or length is less than 10, it returns false meaning its not valid

    List<String> dtItems = dt.split("-"); ///this takes the valid date, splits it using - and stores as a list
    var date = DateTime(int.parse(dtItems[0]), ///this converts the first item splitted into an integer
    int.parse(dtItems[1]), ///converts second item in the list to integer
    int.parse(dtItems[2])); ///converts third item in the list into integer

    return date != null && isDate(dt) && date.isAfter(DateTime.now()); /// returns the date if it is not null, in the right format and is after the present date
  }

  static String? daysAheadAsString(int daysAhead){
    var presentDate = DateTime.now();
    DateTime futureTime = presentDate.add(Duration(days: daysAhead)); ///this function takes in the number of days ahead, adds to the present date and returns it as the future date
    return ftDateAsString(futureTime);
  }

  static String? ftDateAsString(DateTime futureTime){
    return "${futureTime.year}-${futureTime.month.toString().padLeft(2, "0")}-${futureTime.day.toString().padLeft(2, "0")}"; ///this function converts the future date to string
  }

  static String? TrimDate(String date){
    if (date.contains(" ")) {
      List<String> p = date.split(" "); ///if the date contains a space, this function splits it into a list and returns the value as date
      return p[0];
    }
    else
      return date;
  }

}