import 'package:loggy/loggy.dart';

Future<void> initPackages() async {
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
}
