import 'package:art_board/Models/Images.dart';
import 'package:http/http.dart'as http;

class ablumRemote
{
Future<List<Images>?> getImages()async{
  var photourl = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var client = http.Client();
  var response = await client.get(photourl);

  if(response.statusCode == 200)
  {
    var json = response.body;
    return imagesFromJson(json);
  }
  

}
}