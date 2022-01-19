import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/album_bloc.dart';
import 'bloc/album_state.dart';
import 'bloc/event.dart';
import 'model/album.dart';
class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}
class _AlbumsScreenState extends State<AlbumsScreen> {
  //
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }
  _loadAlbums() async {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AlbumsBloc, AlbumsState>(
              builder: (BuildContext context, AlbumsState state) {
                if (state is AlbumsListError) {
                  print(state.error);
                  final error = state.error;
                  String message = '${error.message}\nTap to Retry.';
                  return GestureDetector(
                    onTap: _loadAlbums,
                    child: Text(
                     message
                    ),
                  );
                }
                if (state is AlbumsLoaded) {
                  List<Album>? albums = state.albums;
                  return _list(albums);
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
  Widget _list(List<Album>? albums) {
    return ListView.builder(
      itemCount: albums!.length,
      itemBuilder: (_, index) {
        Album album = albums[index];
        return ListTile(title: Text(album.title!),);
      },
    );
  }
}
