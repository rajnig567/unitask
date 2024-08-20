part of 'extension.dart';

extension XDoubleExtension on double {
  Widget get widthSizedBox => SizedBox(width: this);
  Widget get heightSizedBox => SizedBox(height: this);
}

extension XIntExtension on int {
  Widget get widthSizedBox => SizedBox(width: toDouble());
  Widget get heightSizedBox => SizedBox(height: toDouble());
}
