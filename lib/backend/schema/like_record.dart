import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LikeRecord extends FirestoreRecord {
  LikeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  bool hasUsuario() => _usuario != null;

  // "Liked" field.
  bool? _liked;
  bool get liked => _liked ?? false;
  bool hasLiked() => _liked != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _usuario = snapshotData['Usuario'] as String?;
    _liked = snapshotData['Liked'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('like')
          : FirebaseFirestore.instance.collectionGroup('like');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('like').doc();

  static Stream<LikeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikeRecord.fromSnapshot(s));

  static Future<LikeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikeRecord.fromSnapshot(s));

  static LikeRecord fromSnapshot(DocumentSnapshot snapshot) => LikeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikeRecordData({
  String? usuario,
  bool? liked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Usuario': usuario,
      'Liked': liked,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikeRecordDocumentEquality implements Equality<LikeRecord> {
  const LikeRecordDocumentEquality();

  @override
  bool equals(LikeRecord? e1, LikeRecord? e2) {
    return e1?.usuario == e2?.usuario && e1?.liked == e2?.liked;
  }

  @override
  int hash(LikeRecord? e) => const ListEquality().hash([e?.usuario, e?.liked]);

  @override
  bool isValidKey(Object? o) => o is LikeRecord;
}
