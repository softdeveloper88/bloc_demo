import 'dart:async';
import 'dart:io';
import 'package:bloc_demo/model/album.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../album_repo.dart';
import '../no_internet_exception.dart';
import 'album_state.dart';
import 'event.dart';
class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  AlbumsRepo? albumsRepo;
  List<Album>? albums;

  AlbumsBloc(this.albumsRepo) : super(AlbumsInitState()){

    on<AlbumEvents>(_onWeatherRequested1);

  }
// Future<void> _onWeatherRequested1(AlbumsLoaded event, Emitter<AlbumsState> emit) async {
//   emit(AlbumsLoading());
//   try {
//     final albums = await _albumsRepo.getAlbumList();
//     emit(AlbumsLoaded(albums: albums));
//     } catch (_) {
//       emit(AlbumsListError());
//     }
//   }
// }
  // @override
  // Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
  //   switch (event) {
  //     case AlbumEvents.fetchAlbums:
  //       yield AlbumsLoading();
  //       try {
  //         albums = await albumsRepo!.getAlbumList();
  //         yield AlbumsLoaded(albums: albums);
  //       } on SocketException {
  //         yield AlbumsListError(
  //           error: NoInternetException('No Internet'),
  //         );
  //       } on HttpException {
  //         yield AlbumsListError(
  //           error: NoServiceFoundException('No Service Found'),
  //         );
  //       } on FormatException {
  //         yield AlbumsListError(
  //           error: InvalidFormatException('Invalid Response format'),
  //         );
  //       } catch (e) {
  //         yield AlbumsListError(
  //           error: UnknownException('Unknown Error'),
  //         );
  //       }
  //       break;
  //   }
  // }
  FutureOr<void> _onWeatherRequested1(AlbumEvents event, Emitter<AlbumsState> emit) async{
    emit(AlbumsLoading());
  try {
    final albums = await albumsRepo?.getAlbumList();
    emit(AlbumsLoaded(albums: albums));
    } catch (_) {
      emit(AlbumsListError());
    }
  }
  }

