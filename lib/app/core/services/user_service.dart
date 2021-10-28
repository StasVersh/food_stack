import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_stack/app/core/values/database_constants.dart';
import 'package:food_stack/app/data/model/recipe.dart';
import 'package:food_stack/app/data/model/user.dart';

class UserService {
  late final FirebaseFirestore _firebaseDatabase;

  UserService(this._firebaseDatabase);

  Future addUser(User user) async {
    var usersData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .add(user.toJson());
    updateUsers(User(
      usersData.id,
      user.firstName,
      user.lustName,
      user.favorites,
    ));
  }

  Future addFavorite(Recipe recipe) async {
    var userData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .doc(DatabasePaths.userId)
        .get();
    List<String> favorits = List<String>.from(userData.get('favorites'));
    favorits.add(recipe.id);
    updateUsers(
      User(
        userData.get('id'),
        userData.get('firstName'),
        userData.get('lustName'),
        favorits,
      ),
    );
  }

  Future removeFavorite(Recipe recipe, index) async {
    var userData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .doc(DatabasePaths.userId)
        .get();
    List<String> favorits = List<String>.from(userData.get('favorites'));
    favorits.removeAt(index);
    updateUsers(
      User(
        userData.get('id'),
        userData.get('firstName'),
        userData.get('lustName'),
        favorits,
      ),
    );
  }

  Future updateUsers(User user) async {
    var recipeData = await _firebaseDatabase
        .collection(DatabasePaths.usersPath)
        .doc(user.id)
        .update(user.toJson());
  }

  Future<List<User>> getUsers() async {
    var usersData =
        await _firebaseDatabase.collection(DatabasePaths.usersPath).get();
    var users = usersData.docs.map((e) => User.fromDataset(e)).toList();
    return users.reversed.toList();
  }
}
