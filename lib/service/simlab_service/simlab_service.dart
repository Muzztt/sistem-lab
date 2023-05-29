import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

class SimlabService {
  add({
    required String fullName,
    required String email,
    required String loan,
    required DateTime start,
    required DateTime finish,
  }) async {
    var snapshot = await FirebaseFirestore.instance
        .collection("datamaster")
        .where("email", isEqualTo: email)
        .get();
    if (snapshot.docs.isNotEmpty) {
      throw Exception("This user already exists!");
    }
    await FirebaseFirestore.instance.collection("datamaster").add({
      "full_name": fullName,
      "email": email,
      "loan": loan,
      "mulai_pinjam": start,
      "selesai_pinjam": finish,
    });
  }
}
