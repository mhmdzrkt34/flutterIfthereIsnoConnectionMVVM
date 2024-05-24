import 'package:cleanarchitectureandrepopattern/model_views/home_model_view.dart';
import 'package:cleanarchitectureandrepopattern/models/post_model.dart';
import 'package:cleanarchitectureandrepopattern/respositories/PostRepositories/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PostApi extends PostRepository {


  final Dio dio=Dio();



  PostApi(){

    dio.options.baseUrl="https://jsonplaceholder.typicode.com/";




  }

  @override
  Future<List<PostModel>?> getPosts() async{


    List<PostModel>? posts;


    try {


      List<dynamic> data=(await dio.get("posts")).data as List;
      

      List<PostModel> postsData=[];

      for(var item in data){


        PostModel post=PostModel.FromJson(item);

        postsData.add(post);





      }
      
      posts=postsData;

      GetIt.instance.get<HomeModelView>().changeCathcGoToFalse();
      return posts;






    }catch(e){

      GetIt.instance.get<HomeModelView>().changeCathcGoToTrue();

      
      


      return posts;
    }
  
  }
  



  
}