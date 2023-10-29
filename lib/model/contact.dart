class ContactModel{
  final int? id;
  final String name;
  final String number;
  final String avatar;
  final String? email;

  ContactModel({
    this.id,
    required this.name,
    required this.number,
    required this.avatar,
    this.email,
  });

  ContactModel.fromMap(Map<String,dynamic> res)
      : id = res['id'],
        name = res['name'],
        number = res['number'],
        avatar = res['avatar'],
        email= res['email'];

  Map<String,Object?> toMap(){
    return {
      "id" : id,
      'name' : name,
      'number' : number,
      'avatar' : avatar,
      'email' : email,
    };
  }
}