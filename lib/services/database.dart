import '../imports/imports.dart';

class DatabaseServices {
  static Future<bool> updateFruits({
    String? number,
  }) async {
    try {
      await Firebase.initializeApp();
      final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference fruitReference =
          firestoreInstance.collection('fruits');
      await fruitReference.doc("fruit").set({
        'number': number,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
