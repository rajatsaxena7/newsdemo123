import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Headlines" field.
  String? _headlines;
  String get headlines => _headlines ?? '';
  bool hasHeadlines() => _headlines != null;

  // "Descriptions" field.
  String? _descriptions;
  String get descriptions => _descriptions ?? '';
  bool hasDescriptions() => _descriptions != null;

  // "contentwritter" field.
  String? _contentwritter;
  String get contentwritter => _contentwritter ?? '';
  bool hasContentwritter() => _contentwritter != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "Coverphoto" field.
  String? _coverphoto;
  String get coverphoto => _coverphoto ?? '';
  bool hasCoverphoto() => _coverphoto != null;

  // "Magazine" field.
  String? _magazine;
  String get magazine => _magazine ?? '';
  bool hasMagazine() => _magazine != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "audiopath" field.
  String? _audiopath;
  String get audiopath => _audiopath ?? '';
  bool hasAudiopath() => _audiopath != null;

  void _initializeFields() {
    _headlines = snapshotData['Headlines'] as String?;
    _descriptions = snapshotData['Descriptions'] as String?;
    _contentwritter = snapshotData['contentwritter'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _place = snapshotData['place'] as String?;
    _photo = snapshotData['photo'] as String?;
    _coverphoto = snapshotData['Coverphoto'] as String?;
    _magazine = snapshotData['Magazine'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _audiopath = snapshotData['audiopath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? headlines,
  String? descriptions,
  String? contentwritter,
  DateTime? time,
  String? place,
  String? photo,
  String? coverphoto,
  String? magazine,
  DateTime? date,
  String? audiopath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Headlines': headlines,
      'Descriptions': descriptions,
      'contentwritter': contentwritter,
      'time': time,
      'place': place,
      'photo': photo,
      'Coverphoto': coverphoto,
      'Magazine': magazine,
      'date': date,
      'audiopath': audiopath,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.headlines == e2?.headlines &&
        e1?.descriptions == e2?.descriptions &&
        e1?.contentwritter == e2?.contentwritter &&
        e1?.time == e2?.time &&
        e1?.place == e2?.place &&
        e1?.photo == e2?.photo &&
        e1?.coverphoto == e2?.coverphoto &&
        e1?.magazine == e2?.magazine &&
        e1?.date == e2?.date &&
        e1?.audiopath == e2?.audiopath;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.headlines,
        e?.descriptions,
        e?.contentwritter,
        e?.time,
        e?.place,
        e?.photo,
        e?.coverphoto,
        e?.magazine,
        e?.date,
        e?.audiopath
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
