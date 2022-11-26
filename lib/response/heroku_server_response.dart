import "package:http/http.dart" as http;
import "dart:convert";

class HerokuServer {
  //**************** Heroku Server Stuff ****************

  Future<String> predict(var body) async {
    //Sending input to the server
    var client = new http.Client();
    var url =  "https://amazonsentiment-analysis.herokuapp.com//predict";
    var uri = Uri.parse(url);
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    print(jsonString);
    var response = await client.post(uri, headers: headers, body: jsonString);
    print(response.statusCode);
    //Getting response from server
    if (response.statusCode == 200) {
      //Server connected & data sent -> 200 = OK
      print("SUCCESS!");
      var result = json.decode(response.body); // Decoding the resultant
      print(result['prediction']);
      return result['prediction']; //Output
    }
    else {
      //Connection could not be made -> 400-599 = Error
      return 'A server error has occurred'; //Errors can be caught if needed

    }
  }


  Future<void> startUp() async {
    String url = "https://amazonsentiment-analysis.herokuapp.com/";
    http.Response response = await http.get(url);

  }
}
