import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingQuestionsRecord extends FirestoreRecord {
  OnboardingQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "required" field.
  bool? _required;
  bool get required => _required ?? false;
  bool hasRequired() => _required != null;

  // "state" field.
  int? _state;
  int get state => _state ?? 0;
  bool hasState() => _state != null;

  // "answers" field.
  AnswersStruct? _answers;
  AnswersStruct get answers => _answers ?? AnswersStruct();
  bool hasAnswers() => _answers != null;

  // "limit" field.
  int? _limit;
  int get limit => _limit ?? 0;
  bool hasLimit() => _limit != null;

  // "last_question" field.
  bool? _lastQuestion;
  bool get lastQuestion => _lastQuestion ?? false;
  bool hasLastQuestion() => _lastQuestion != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  bool hasKey() => _key != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _required = snapshotData['required'] as bool?;
    _state = castToType<int>(snapshotData['state']);
    _answers = snapshotData['answers'] is AnswersStruct
        ? snapshotData['answers']
        : AnswersStruct.maybeFromMap(snapshotData['answers']);
    _limit = castToType<int>(snapshotData['limit']);
    _lastQuestion = snapshotData['last_question'] as bool?;
    _key = snapshotData['key'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onboarding_questions');

  static Stream<OnboardingQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnboardingQuestionsRecord.fromSnapshot(s));

  static Future<OnboardingQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OnboardingQuestionsRecord.fromSnapshot(s));

  static OnboardingQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnboardingQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnboardingQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnboardingQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnboardingQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnboardingQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnboardingQuestionsRecordData({
  String? title,
  String? description,
  bool? required,
  int? state,
  AnswersStruct? answers,
  int? limit,
  bool? lastQuestion,
  String? key,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'required': required,
      'state': state,
      'answers': AnswersStruct().toMap(),
      'limit': limit,
      'last_question': lastQuestion,
      'key': key,
    }.withoutNulls,
  );

  // Handle nested data for "answers" field.
  addAnswersStructData(firestoreData, answers, 'answers');

  return firestoreData;
}

class OnboardingQuestionsRecordDocumentEquality
    implements Equality<OnboardingQuestionsRecord> {
  const OnboardingQuestionsRecordDocumentEquality();

  @override
  bool equals(OnboardingQuestionsRecord? e1, OnboardingQuestionsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.required == e2?.required &&
        e1?.state == e2?.state &&
        e1?.answers == e2?.answers &&
        e1?.limit == e2?.limit &&
        e1?.lastQuestion == e2?.lastQuestion &&
        e1?.key == e2?.key;
  }

  @override
  int hash(OnboardingQuestionsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.required,
        e?.state,
        e?.answers,
        e?.limit,
        e?.lastQuestion,
        e?.key
      ]);

  @override
  bool isValidKey(Object? o) => o is OnboardingQuestionsRecord;
}
