import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NoticiasRecord extends FirestoreRecord {
  NoticiasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Autor" field.
  String? _autor;
  String get autor => _autor ?? '';
  bool hasAutor() => _autor != null;

  // "ContadorComentarios" field.
  int? _contadorComentarios;
  int get contadorComentarios => _contadorComentarios ?? 0;
  bool hasContadorComentarios() => _contadorComentarios != null;

  // "Contenido" field.
  String? _contenido;
  String get contenido => _contenido ?? '';
  bool hasContenido() => _contenido != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "ContadorLikes" field.
  int? _contadorLikes;
  int get contadorLikes => _contadorLikes ?? 0;
  bool hasContadorLikes() => _contadorLikes != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _autor = snapshotData['Autor'] as String?;
    _contadorComentarios = castToType<int>(snapshotData['ContadorComentarios']);
    _contenido = snapshotData['Contenido'] as String?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _titulo = snapshotData['Titulo'] as String?;
    _contadorLikes = castToType<int>(snapshotData['ContadorLikes']);
    _categoria = snapshotData['Categoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Noticias');

  static Stream<NoticiasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoticiasRecord.fromSnapshot(s));

  static Future<NoticiasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoticiasRecord.fromSnapshot(s));

  static NoticiasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NoticiasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoticiasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoticiasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoticiasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoticiasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoticiasRecordData({
  String? autor,
  int? contadorComentarios,
  String? contenido,
  DateTime? fecha,
  String? titulo,
  int? contadorLikes,
  String? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Autor': autor,
      'ContadorComentarios': contadorComentarios,
      'Contenido': contenido,
      'Fecha': fecha,
      'Titulo': titulo,
      'ContadorLikes': contadorLikes,
      'Categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoticiasRecordDocumentEquality implements Equality<NoticiasRecord> {
  const NoticiasRecordDocumentEquality();

  @override
  bool equals(NoticiasRecord? e1, NoticiasRecord? e2) {
    return e1?.autor == e2?.autor &&
        e1?.contadorComentarios == e2?.contadorComentarios &&
        e1?.contenido == e2?.contenido &&
        e1?.fecha == e2?.fecha &&
        e1?.titulo == e2?.titulo &&
        e1?.contadorLikes == e2?.contadorLikes &&
        e1?.categoria == e2?.categoria;
  }

  @override
  int hash(NoticiasRecord? e) => const ListEquality().hash([
        e?.autor,
        e?.contadorComentarios,
        e?.contenido,
        e?.fecha,
        e?.titulo,
        e?.contadorLikes,
        e?.categoria
      ]);

  @override
  bool isValidKey(Object? o) => o is NoticiasRecord;
}
