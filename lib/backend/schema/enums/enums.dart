import 'package:collection/collection.dart';

enum AnswerType {
  single_select,
  number,
  multi_select,
}

enum DialogState {
  AI_talking,
  user_talking,
  pause,
  processing,
  none,
}

enum Gender {
  female,
  male,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AnswerType):
      return AnswerType.values.deserialize(value) as T?;
    case (DialogState):
      return DialogState.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    default:
      return null;
  }
}
