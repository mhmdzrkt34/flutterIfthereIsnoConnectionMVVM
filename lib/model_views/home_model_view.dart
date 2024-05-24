import 'dart:ffi';

import 'package:cleanarchitectureandrepopattern/models/post_model.dart';
import 'package:cleanarchitectureandrepopattern/respositories/PostRepositories/post_api.dart';
import 'package:cleanarchitectureandrepopattern/respositories/PostRepositories/post_repository.dart';
import 'package:flutter/material.dart';

class HomeModelView extends ChangeNotifier {


  List<PostModel>? posts;

  bool catchgo=false;



  PostRepository postRepository=PostApi();
  


  HomeModelView(){


    getPosts();



  }



  Future<void> getPosts() async{


    List<PostModel>? results=await postRepository.getPosts();


    posts=results;

    notifyListeners();






}

void changeCathcGoToFalse(){


  catchgo=false;
  notifyListeners();
}

void changeCathcGoToTrue(){


  catchgo=true;
  notifyListeners();
}


  }