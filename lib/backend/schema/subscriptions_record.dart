import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subId" field.
  String? _subId;
  String get subId => _subId ?? '';
  bool hasSubId() => _subId != null;

  // "ttsHD" field.
  bool? _ttsHD;
  bool get ttsHD => _ttsHD ?? false;
  bool hasTtsHD() => _ttsHD != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "pronunciation" field.
  bool? _pronunciation;
  bool get pronunciation => _pronunciation ?? false;
  bool hasPronunciation() => _pronunciation != null;

  // "lessonLimit" field.
  int? _lessonLimit;
  int get lessonLimit => _lessonLimit ?? 0;
  bool hasLessonLimit() => _lessonLimit != null;

  // "frequencyPerWeek" field.
  int? _frequencyPerWeek;
  int get frequencyPerWeek => _frequencyPerWeek ?? 0;
  bool hasFrequencyPerWeek() => _frequencyPerWeek != null;

  void _initializeFields() {
    _subId = snapshotData['subId'] as String?;
    _ttsHD = snapshotData['ttsHD'] as bool?;
    _name = snapshotData['name'] as String?;
    _pronunciation = snapshotData['pronunciation'] as bool?;
    _lessonLimit = castToType<int>(snapshotData['lessonLimit']);
    _frequencyPerWeek = castToType<int>(snapshotData['frequencyPerWeek']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? subId,
  bool? ttsHD,
  String? name,
  bool? pronunciation,
  int? lessonLimit,
  int? frequencyPerWeek,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subId': subId,
      'ttsHD': ttsHD,
      'name': name,
      'pronunciation': pronunciation,
      'lessonLimit': lessonLimit,
      'frequencyPerWeek': frequencyPerWeek,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.subId == e2?.subId &&
        e1?.ttsHD == e2?.ttsHD &&
        e1?.name == e2?.name &&
        e1?.pronunciation == e2?.pronunciation &&
        e1?.lessonLimit == e2?.lessonLimit &&
        e1?.frequencyPerWeek == e2?.frequencyPerWeek;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.subId,
        e?.ttsHD,
        e?.name,
        e?.pronunciation,
        e?.lessonLimit,
        e?.frequencyPerWeek
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
