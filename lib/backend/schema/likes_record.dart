import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LikesRecord extends FirestoreRecord {
  LikesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Noticia" field.
  String? _noticia;
  String get noticia => _noticia ?? '';
  bool hasNoticia() => _noticia != null;

  // "Usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  bool hasUsuario() => _usuario != null;

  // "Liked" field.
  bool? _liked;
  bool get liked => _liked ?? false;
  bool hasLiked() => _liked != null;

  void _initializeFields() {
    _noticia = snapshotData['Noticia'] as String?;
    _usuario = snapshotData['Usuario'] as String?;
    _liked = snapshotData['Liked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Likes');

  static Stream<LikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikesRecord.fromSnapshot(s));

  static Future<LikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikesRecord.fromSnapshot(s));

  static LikesRecord fromSnapshot(DocumentSnapshot snapshot) => LikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikesRecordData({
  String? noticia,
  String? usuario,
  bool? liked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Noticia': noticia,
      'Usuario': usuario,
      'Liked': liked,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikesRecordDocumentEquality implements Equality<LikesRecord> {
  const LikesRecordDocumentEquality();

  @override
  bool equals(LikesRecord? e1, LikesRecord? e2) {
    return e1?.noticia == e2?.noticia &&
        e1?.usuario == e2?.usuario &&
        e1?.liked == e2?.liked;
  }

  @override
  int hash(LikesRecord? e) =>
      const ListEquality().hash([e?.noticia, e?.usuario, e?.liked]);

  @override
  bool isValidKey(Object? o) => o is LikesRecord;
}
