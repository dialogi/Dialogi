import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "onboarded" field.
  bool? _onboarded;
  bool get onboarded => _onboarded ?? false;
  bool hasOnboarded() => _onboarded != null;

  // "notification" field.
  bool? _notification;
  bool get notification => _notification ?? false;
  bool hasNotification() => _notification != null;

  // "walkthrow" field.
  bool? _walkthrow;
  bool get walkthrow => _walkthrow ?? false;
  bool hasWalkthrow() => _walkthrow != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "notificationsTime" field.
  DateTime? _notificationsTime;
  DateTime? get notificationsTime => _notificationsTime;
  bool hasNotificationsTime() => _notificationsTime != null;

  // "lessonsAlert" field.
  bool? _lessonsAlert;
  bool get lessonsAlert => _lessonsAlert ?? false;
  bool hasLessonsAlert() => _lessonsAlert != null;

  // "seenAt" field.
  DateTime? _seenAt;
  DateTime? get seenAt => _seenAt;
  bool hasSeenAt() => _seenAt != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _onboarded = snapshotData['onboarded'] as bool?;
    _notification = snapshotData['notification'] as bool?;
    _walkthrow = snapshotData['walkthrow'] as bool?;
    _gender = deserializeEnum<Gender>(snapshotData['gender']);
    _notificationsTime = snapshotData['notificationsTime'] as DateTime?;
    _lessonsAlert = snapshotData['lessonsAlert'] as bool?;
    _seenAt = snapshotData['seenAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? onboarded,
  bool? notification,
  bool? walkthrow,
  Gender? gender,
  DateTime? notificationsTime,
  bool? lessonsAlert,
  DateTime? seenAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'onboarded': onboarded,
      'notification': notification,
      'walkthrow': walkthrow,
      'gender': gender,
      'notificationsTime': notificationsTime,
      'lessonsAlert': lessonsAlert,
      'seenAt': seenAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.onboarded == e2?.onboarded &&
        e1?.notification == e2?.notification &&
        e1?.walkthrow == e2?.walkthrow &&
        e1?.gender == e2?.gender &&
        e1?.notificationsTime == e2?.notificationsTime &&
        e1?.lessonsAlert == e2?.lessonsAlert &&
        e1?.seenAt == e2?.seenAt;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.onboarded,
        e?.notification,
        e?.walkthrow,
        e?.gender,
        e?.notificationsTime,
        e?.lessonsAlert,
        e?.seenAt
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
