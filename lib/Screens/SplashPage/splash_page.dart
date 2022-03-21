import 'package:chat_app/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import '../../services/media_service.dart';
import '../../services/cloud_storage_service.dart';
import '../../services/navigation_service.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then(
      (_) {
        _setup().then(
          (_) => widget.onInitializationComplete(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UChat',
      theme: ThemeData(
        backgroundColor: Color(0xFF242331),
        scaffoldBackgroundColor: Color(0xFF242331),
      ),
      home: Scaffold(
          body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              // ignore: prefer_const_constructors
              image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/images/logo.png'),
          )),
        ),
      )),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );
    GetIt.instance.registerSingleton<CloudStorageServices>(
      CloudStorageServices(),
    );
    GetIt.instance.registerSingleton<Databaseservices>(
      Databaseservices(),
    );
  }
}
