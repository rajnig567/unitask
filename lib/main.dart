import 'package:unitask/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  APIProvider.instance.init();
  runApp(const MyApp());
}
