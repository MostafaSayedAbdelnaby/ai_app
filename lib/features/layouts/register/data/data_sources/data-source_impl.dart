import 'package:ai_app/features/layouts/register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data_source.dart';

class DataSourceImpl implements DataSource {
  /// User Collection
  CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Register
  @override
  Future<void> register(UserModel userModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      userModel.id = credential.user!.uid;
      // Save user data in Firestore & set data for document
      await addUser(userModel);
      // credential.user!.sendEmailVerification(); // ***
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Add User
  @override
  Future<void> addUser(UserModel userModel) async {
    var collection = FirebaseFirestore.instance.collection("Users");
    try {
      var ref = collection.doc(userModel.id);
      // userModel.id = ref.id;
      await ref.set(userModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
