import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MagazineRecord extends FirestoreRecord {
  MagazineRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "magazinetitle" field.
  String? _magazinetitle;
  String get magazinetitle => _magazinetitle ?? '';
  bool hasMagazinetitle() => _magazinetitle != null;

  // "magazineimage" field.
  String? _magazineimage;
  String get magazineimage => _magazineimage ?? '';
  bool hasMagazineimage() => _magazineimage != null;

  // "magazinecontent" field.
  String? _magazinecontent;
  String get magazinecontent => _magazinecontent ?? '';
  bool hasMagazinecontent() => _magazinecontent != null;

  // "audiocontent" field.
  String? _audiocontent;
  String get audiocontent => _audiocontent ?? '';
  bool hasAudiocontent() => _audiocontent != null;

  // "magazinemonth" field.
  DateTime? _magazinemonth;
  DateTime? get magazinemonth => _magazinemonth;
  bool hasMagazinemonth() => _magazinemonth != null;

  void _initializeFields() {
    _magazinetitle = snapshotData['magazinetitle'] as String?;
    _magazineimage = snapshotData['magazineimage'] as String?;
    _magazinecontent = snapshotData['magazinecontent'] as String?;
    _audiocontent = snapshotData['audiocontent'] as String?;
    _magazinemonth = snapshotData['magazinemonth'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Magazine');

  static Stream<MagazineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MagazineRecord.fromSnapshot(s));

  static Future<MagazineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MagazineRecord.fromSnapshot(s));

  static MagazineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MagazineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MagazineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MagazineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MagazineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MagazineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMagazineRecordData({
  String? magazinetitle,
  String? magazineimage,
  String? magazinecontent,
  String? audiocontent,
  DateTime? magazinemonth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'magazinetitle': magazinetitle,
      'magazineimage': magazineimage,
      'magazinecontent': magazinecontent,
      'audiocontent': audiocontent,
      'magazinemonth': magazinemonth,
    }.withoutNulls,
  );

  return firestoreData;
}

class MagazineRecordDocumentEquality implements Equality<MagazineRecord> {
  const MagazineRecordDocumentEquality();

  @override
  bool equals(MagazineRecord? e1, MagazineRecord? e2) {
    return e1?.magazinetitle == e2?.magazinetitle &&
        e1?.magazineimage == e2?.magazineimage &&
        e1?.magazinecontent == e2?.magazinecontent &&
        e1?.audiocontent == e2?.audiocontent &&
        e1?.magazinemonth == e2?.magazinemonth;
  }

  @override
  int hash(MagazineRecord? e) => const ListEquality().hash([
        e?.magazinetitle,
        e?.magazineimage,
        e?.magazinecontent,
        e?.audiocontent,
        e?.magazinemonth
      ]);

  @override
  bool isValidKey(Object? o) => o is MagazineRecord;
}
