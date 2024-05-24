class PostModel {



  late int userId;

  late int id;
  late String title;

  late String body;




  PostModel({required this.userId,required this.id,required this.title,required this.body});


  static PostModel FromJson(Map<String,dynamic> json){


    return new PostModel(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);



  }




  Map<String,dynamic> ToJson(){


    return {
      "userId":this.userId,

      "id":this.id,

      "title":this.title,
      "body":this.body



    };
  }










}