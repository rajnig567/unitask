import 'package:unitask/provider/home_provider.dart';

import 'core.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    _connectivity.initialise();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MaterialApp(
          title: 'Unitask',
          debugShowCheckedModeBanner: false,
          navigatorKey: Keys.navigationKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ChangeNotifierProvider(
            create: (_) => HomeProvider(
              dataSource: DataSource(),
            )..fetchProductData(),
            child: const HomePage(),
          ),
        ),
        noInternetAlert(),
      ],
    );
  }

  Widget noInternetAlert() {
    return StreamBuilder<bool>(
      stream: _connectivity.networkStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == false) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.highlight_off,
                    color: Colors.white,
                  ),
                  12.0.widthSizedBox,
                  const Text(
                    'You must connect to Wi-fi or a Cellular Network to get online again',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
