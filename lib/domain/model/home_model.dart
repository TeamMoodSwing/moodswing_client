//TODO
class HomeModel {
  final String name;

  HomeModel({required this.name});

  factory HomeModel.fromJson({required Map<String, dynamic> json}) {
    return HomeModel(name: json['name']);
  }
}
