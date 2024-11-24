import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "start_at" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  // "tokens" field.
  int? _tokens;
  int get tokens => _tokens ?? 0;
  bool hasTokens() => _tokens != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "teacher" field.
  TeachersObjStruct? _teacher;
  TeachersObjStruct get teacher => _teacher ?? TeachersObjStruct();
  bool hasTeacher() => _teacher != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "end_at" field.
  DateTime? _endAt;
  DateTime? get endAt => _endAt;
  bool hasEndAt() => _endAt != null;

  // "lessonId" field.
  String? _lessonId;
  String get lessonId => _lessonId ?? '';
  bool hasLessonId() => _lessonId != null;

  // "LessonNum" field.
  int? _lessonNum;
  int get lessonNum => _lessonNum ?? 0;
  bool hasLessonNum() => _lessonNum != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  void _initializeFields() {
    _summary = snapshotData['summary'] as String?;
    _startAt = snapshotData['start_at'] as DateTime?;
    _tokens = castToType<int>(snapshotData['tokens']);
    _user = snapshotData['user'] as String?;
    _teacher = TeachersObjStruct.maybeFromMap(snapshotData['teacher']);
    _subject = snapshotData['subject'] as String?;
    _endAt = snapshotData['end_at'] as DateTime?;
    _lessonId = snapshotData['lessonId'] as String?;
    _lessonNum = castToType<int>(snapshotData['LessonNum']);
    _steps = castToType<int>(snapshotData['steps']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessons');

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? summary,
  DateTime? startAt,
  int? tokens,
  String? user,
  TeachersObjStruct? teacher,
  String? subject,
  DateTime? endAt,
  String? lessonId,
  int? lessonNum,
  int? steps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'summary': summary,
      'start_at': startAt,
      'tokens': tokens,
      'user': user,
      'teacher': TeachersObjStruct().toMap(),
      'subject': subject,
      'end_at': endAt,
      'lessonId': lessonId,
      'LessonNum': lessonNum,
      'steps': steps,
    }.withoutNulls,
  );

  // Handle nested data for "teacher" field.
  addTeachersObjStructData(firestoreData, teacher, 'teacher');

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.summary == e2?.summary &&
        e1?.startAt == e2?.startAt &&
        e1?.tokens == e2?.tokens &&
        e1?.user == e2?.user &&
        e1?.teacher == e2?.teacher &&
        e1?.subject == e2?.subject &&
        e1?.endAt == e2?.endAt &&
        e1?.lessonId == e2?.lessonId &&
        e1?.lessonNum == e2?.lessonNum &&
        e1?.steps == e2?.steps;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.summary,
        e?.startAt,
        e?.tokens,
        e?.user,
        e?.teacher,
        e?.subject,
        e?.endAt,
        e?.lessonId,
        e?.lessonNum,
        e?.steps
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
