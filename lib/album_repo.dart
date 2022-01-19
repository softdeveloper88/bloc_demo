import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'model/album.dart';
abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}
class AlbumServices implements AlbumsRepo {
  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}