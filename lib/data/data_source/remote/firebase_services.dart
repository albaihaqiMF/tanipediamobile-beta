part of 'remote_services.dart';

class FirebaseServices {
  static const String tag = 'FIRESTORE';
  static registerFirestore(
      String userId, String uid, String phoneNumber, String username) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userRef = firestore.collection('pengguna');
    Query query = userRef.where('user_id', isEqualTo: int.parse(userId));
    query.get().then((value) {
      print('$tag doc : ${value.docs}');
      if (value.docs.isEmpty) {
        print('Firestore : Add to Firestore');
        userRef.add({
          'user_id': int.tryParse(userId) ?? 0,
          'user_phone': phoneNumber,
          'device_token': uid,
          'username': username,
        });
      } else {
        print('$tag : Update to Firestore');
        value.docs.forEach((element) {
          userRef.doc(element.id).update(
            {
              'user_phone': phoneNumber,
              'device_token': uid,
              'username': username,
            },
          );
        });
      }
    });
  }
}
