import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_prayers/model/paryers_data.dart';

class PrayersService {
  static String url = "https://api.aladhan.com/v1/calendar/";

  static Future<PrayersData?> getPrayers(
      String year, String month, String longitude, String latitude) async {
    final response = await http.get(
        Uri.parse("$url/$year/$month?latitude=$latitude&longitude=$longitude"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      PrayersData prayersData = PrayersData.fromJson(data);
      return prayersData;
    } else {
      return null;
    }
    // } catch (e) {
    //   print(e.toString());
    //   DialogUtils.noNetworkDialog();
    //   return null;
    // }
  }
}
