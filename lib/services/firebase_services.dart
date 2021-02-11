part of 'services.dart';

class FirebaseServices {
  static registerFirestore(
      String userId, String uid, String phoneNumber) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userRef = firestore.collection('pengguna');
    Query query = userRef.where('user_id', isEqualTo: int.parse(userId));
    query.get().then((value) {
      print('Firestore doc : ${value.docs}');
      if (value.docs.isEmpty) {
        print('Firestore : Add to Firestore');
        userRef.add({
          'user_id': int.tryParse(userId) ?? 0,
          'user_phone': int.tryParse(phoneNumber) ?? 0,
          'device_token': uid,
        });
      } else {
        print('Firestore : Update to Firestore');
        value.docs.forEach((element) {
          userRef.doc(element.id).update(
            {'user_phone': phoneNumber, 'device_token': uid},
          );
        });
      }
    });
  }
}
