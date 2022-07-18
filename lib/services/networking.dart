import 'package:http/http.dart' as http;
import 'dart:convert';



class NetworkHelper{
  NetworkHelper(this.api,this.apitype,this.query);

  final String api,apitype;
  final Map<String,dynamic> query;
   Future getData() async {
     var url = Uri.http(api, apitype, query);
     var response = await http.get(url);
     if (response.statusCode == 200) {
       String data = response.body;
       
       var decodingdata = jsonDecode(data);

       return decodingdata;

     }
     else
       print(response.statusCode);

   }

}