import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/route/app_route.dart';
import 'package:task/core/service/network.dart';
import 'package:task/core/theme/app_theme.dart';
import 'package:task/feature/post/data/repository/post_repository.dart';

void main() {
  runApp(TaskApp());
}

// ignore: must_be_immutable
class TaskApp extends StatelessWidget {
  TaskApp({super.key});
  NetworkService networkService = NetworkService(dio: Dio());
  @override
  Widget build(BuildContext context) {
    final router = AppRoute.router;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => PostRepository(networkService)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'Task',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
