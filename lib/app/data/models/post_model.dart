class PostModel {
  final String userId;
  final String title;
  final String body;

  PostModel({
    required this.userId, 
    required this.title, 
    required this.body
  });

  factory PostModel.fromMap(Map<String, dynamic> map){
    return PostModel(
      userId: map['userId'].toString(),
      title: map['title'] ?? '',
      body: map['body'] ?? '',

      );
  }

  
}
