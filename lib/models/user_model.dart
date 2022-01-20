class UserModel{

  String? uid;
  String? name;
  String? id;
  String? department;
  String? email;

  UserModel({this.uid, this.name, this.id, this.department, this.email});

  // receive data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(

      uid: map['uid'],
      name: map['name'],
      id: map['id'],
      department: map['department'],
      email: map['email']
    );
  }

  // sending data to server
  Map<String, dynamic> toMap()
  {
    return {

      'uid': uid,
      'name': name,
      'id': id,
      'department': department,
      'email': email
    };
  }
}