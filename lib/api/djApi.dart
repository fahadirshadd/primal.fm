import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/ProgresPopup.dart';

class djApi {

  Future apiCall() async {
    var response = await http.get(
        Uri.parse(djApiUrl),
    );

    if (response.statusCode == 200) {
        // print(jsonDecode(response.body).toString());
        if(jsonDecode(response.body)['Stream']['isDJ'])
          return true;
        else
          return false;

    } else {
      return false;
    }
  }

}
