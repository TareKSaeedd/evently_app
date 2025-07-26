class UserModel {
  String id;
  String name;
  String email;
  static const collectionName = 'users';

  UserModel({required this.id, required this.email, required this.name});

  //todo: from firestore map => object
  UserModel.fromFireStore(Map<String, dynamic> data)
    : this(id: data['id'], name: data['name'], email: data['email']);

  //todo: to firestore object => map
  Map<String, dynamic> toFireStore() {
    return {"id": id, "name": name, "email": email};
  }
}
