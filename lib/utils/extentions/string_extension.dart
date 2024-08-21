part of 'extension.dart';

extension XString on String {
  String get toFirstCapital => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
}