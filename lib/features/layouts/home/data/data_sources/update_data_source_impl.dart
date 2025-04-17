import 'package:ai_app/features/layouts/home/data/data_sources/update_data_source.dart';
import 'package:ai_app/features/layouts/home/data/models/update_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateDataSourceImpl implements UpdateDataSource {
  @override
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    var collection = FirebaseFirestore.instance.collection("Users");
    var credential = FirebaseAuth.instance.currentUser;
    var ref = collection.doc(credential!.uid);
    // print("**************************************");
    // print(credential.uid);
    try {
      await ref.update(updateUserModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      var useId =
          FirebaseAuth.instance.currentUser?.uid; // get idOfUserData = idOfUser
      await FirebaseAuth.instance.currentUser?.delete(); // delete User
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(useId)
          .delete(); // delete UserData
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UpdateUserModel?> getUser() async {
    var currentUser = FirebaseAuth.instance.currentUser; // Get current user

    try {
      var ref = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser?.uid)
          .get();
      if (ref.exists) {
        return UpdateUserModel.fromJson(ref.data()!);
      } else {
        return null; // User not found
      }
    } catch (e) {
      rethrow;
    }
  }
}
