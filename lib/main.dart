import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/app_imoprts/app_imports.dart';
import 'package:movie_app/model/media_model.dart';
import 'package:movie_app/module/bloc/movie_bloc.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MediaModelAdapter());
  final favoritesBox = await Hive.openBox<MediaModel>('favorites');
  runApp(
    BlocProvider(
      create: (context) => MovieBloc(favoritesBox),
      child: const MovieDemo(),
    ),
  );
}
