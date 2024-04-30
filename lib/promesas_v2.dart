import 'package:http/http.dart' as http;
import 'package:prueba_application_1/types/post.dart';

void main(List<String> arguments) async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/photos');

  try {
    var jsonPost = await http.get(url);
    if (jsonPost.statusCode == 200) {
      final photos = postFromJson(jsonPost.body);
      //final posts = postFromJson(jsonPost.body);
      for (var post in photos) {
        print("Código: ${post.id}");
        print("Titulo: ${post.title}");
        print("url: ${post.url}");
        print("thumbnailUrl: ${post.thumbnailUrl}");
        print("===================================================");
      }
    } else {
      print('No se pudo conectar con el servidor');
    }
  } catch (e) {
    print(e.toString());
  }
}